%% *********************************************************************************************************************************************************
% ELEC5206 Sustainable Energy Systebms Group Assignment:
% Techno-economic feasibility study of a small-scale PV-battery systebm
% 
% Mixed integer linear program for a residential PV-storage systebm
% Chanaka Keethisinghe (chanakak@hotmail.com)
% Dr Gregor Verbic and Dr. Archie Chapman
%  
% The energy managebment problebm is formulated as a mixed integer-linear
% optimisation problebm and modeled in Matlab's Optimization Toolbox
% 
% Matlab Optimization Toolbox provides you with a Mixed-integer linear
% programming (MILP) solver that can be usd to solve the energy managebment
% problebm. But first, you need to formulate the optimisation problebm
% properly.
% 
% An MILP optimisation problebm finds the minimum of a problebm specified by:
% 
% min (over the decision vector x) f'*x subject to
%   x(intcon)   are integer variables
%   A*x <= b     are inequality constraints
%   Aeq*x = beq are equality constraints
%   lb <= x <= ub    are bounds on the decision variables.
% 
% where:
%   f, x, intcon, b, beq, lb, and ub are vectors, and A and Aeq are matrices.
% 
%   x = intlinprog(f,intcon,A,b,Aeq,beq,lb,ub,options)
% 
% more at: http://au.mathworks.com/help/optim/ug/intlinprog.html

%% *********************************************************************************************************************************************************
% Definition of the problebm data
clear all; close all; clc

% Variables
% Daily data in half-hourly resolution stored in Data.xlsx
% Load data from Data.xlsx
input_file = 'cap_calc.xlsx'; N = 48; 

NN = 1;

PD = xlsread(input_file,'LF_Byron_s3','C2:C49')'; % Electrical demand (daily load profile)
PV = xlsread(input_file,'LF_Byron_s3','D2:D49')'; % PV output (daily PV output profile)
RetT = xlsread(input_file,'LF_Byron_s3','E2:E49')'; % Retail electricity tariff
FiT = ones(1,N)*0.055; % Feed-in-tariff

PD = interp(PD,NN);
PV = interp(PV,NN); PV(PV<0) = 0;
RetT = interp(RetT,NN);
FiT = interp(FiT,NN);

N = N*NN;

% Define Electricity Grid data
pgM = 10; % Maximum capacity of grid connection

% Battery Storage
ebM = 7; % battery maximum storage limit [kWh]
ebm = 1; % battery minimum storage limit [kWh]
pbM = 3.5; % battery maximum charging rate [kW]
pbm = 3.5; % battery maximum discharge rate [kW]
etaB = 0.8; % battery efficiency
eb1 = 5; % start-of-day battery state of charge (SOC)
ebN = 5; % end-of-day battery state of charge (SOC)

% Inverter 
etaI = 0.85; % inverter efficiency

% Define time horizon data
horizon = 48; % decision horizon in hours
dt = horizon/N; % time step in hours

%% **********************************************************************************************************************************************************
% Decision variables:
% x = [pgplus, pgminus, pbplus, pbminus, pbg, pbd, dg, dpv, sb, eb]
% pg+/-: power flowing from/to grid
% pb+/-: battery charge/discharge power
% pbg: power flowing from battery to grid
% pbd power flowing from battery to demand
% dg: direction of grid power flow (0: demand->grid, 1: grid->demand)
% dpv: direction of power flow from PV (0: PV->grid, 1: PV->demand)
% sb: battery charging status (0: discharge, 1: charge)
% eb: battery state of charge

%% **********************************************************************************************************************************************************
% These variables are only defined to reduce the size of the code
NoV = 10; % number of variables
eyeNN = eye(N); % diagonal matix of ones [NxN]
zerNN = zeros(N); % zero matrix [NxN]
zer1N = zeros(1,N); % vector of zeros [1xN]
one1N = ones(1,N); % vector of ones [1xN]
zerN1 = zeros(N,1); % vector of zeros [Nx1]
oneN1 = ones(N,1); % vector of ones [Nx1]
NB = inf(N,1); % vector of infs [Nx1]
eyePV = diag(PV); % PV output [NxN]
M = eye(N); P = ones(1,(N-1)); Q = -diag(P,-1);
RW = M+Q; RW(1,:) = zeros(1,N); ZNB = [zeros(1,N);eye((N-1),N)];

% Objective function f'*x
f = zeros(N*NoV,1);
f(1:N,1) = dt*RetT;
f((N+1):(2*N),1) = -dt*FiT;

%% **********************************************************************************************************************************************************
% Equality constraints
% 
% pgplus = PD - etaI*(etaB*pbg + PV*dpv - pbplus)
% pgminus = etaB*etaI*pbg + etaI*PV*(1-dpv)
% pbminus = pbg + pbg
% eb(i) = eb(i-1) - dt*pbminus(i-1) + dt*pbplus(i-1)
% eb(1) = eb1
% eb(N) = ebN
% 
% x = [pgplus, pgminus, pbplus, pbminus, pbg, pbd, dg, dpv, sb, eb]

Aeq = [...
    eyeNN zerNN -eyeNN*etaI  zerNN   zerNN            eyeNN*etaB*etaI zerNN eyePV*etaI zerNN zerNN              ; ...
    zerNN eyeNN  zerNN       zerNN  -eyeNN*etaB*etaI  zerNN           zerNN eyePV*etaI zerNN zerNN              ; ...
    zerNN zerNN  zerNN       eyeNN  -eyeNN           -eyeNN           zerNN zerNN      zerNN zerNN              ; ...
    zerNN zerNN -dt*ZNB      dt*ZNB  zerNN            zerNN           zerNN zerNN      zerNN RW                 ; ...
    zer1N zer1N  zer1N       zer1N   zer1N            zer1N           zer1N zer1N      zer1N [1 zeros(1,(N-1))] ; ...
    zer1N zer1N  zer1N       zer1N   zer1N            zer1N           zer1N zer1N      zer1N [zeros(1,(N-1)) 1] ; ...
      ];

beq = [PD'; etaI*PV'; zerN1; zerN1; eb1; ebN];
%% **********************************************************************************************************************************************************
% Inequality constraints
% 
% pgplus <= pgM*dg
% pgminus <= pgM*(1-dg)
% pbplus <= pbM*sb
% pbminus <= pbm*(1-sb)
% 
% x = [pgplus, pgminus, pbplus, pbminus, pbg, pbd, dg, dpv, sb, eb]

A = [...
    eyeNN zerNN zerNN zerNN zerNN zerNN -pgM*eyeNN zerNN  zerNN     zerNN ; ...
    zerNN eyeNN zerNN zerNN zerNN zerNN  pgM*eyeNN zerNN  zerNN     zerNN ; ...
    zerNN zerNN eyeNN zerNN zerNN zerNN  zerNN     zerNN -pbM*eyeNN zerNN ; ...
    zerNN zerNN zerNN eyeNN zerNN zerNN  zerNN     zerNN  pbm*eyeNN zerNN ; ...
    ];

b = [zerN1; pgM*oneN1; zerN1; pbm*oneN1];
%% **********************************************************************************************************************************************************
% Variables' lower and upper bounds
lb = [zerN1;     zerN1;     zerN1;     zerN1;     zerN1;     zerN1;     zerN1; zerN1; zerN1; ebm*oneN1];
ub = [pgM*oneN1; pgM*oneN1; pbM*oneN1; pbm*oneN1; pbM*oneN1; pbM*oneN1; oneN1; oneN1; oneN1; ebM*oneN1];

% Integer variables
% intcon = [6*N+1:9*N];
% intcon = [6*N+1:7*N,7*N+1:8*N,8*N+1:9*N];
intcon = [6*N+1:7*N,8*N+1:9*N];
%% **********************************************************************************************************************************************************
% Solve the optimisation problem
options = optimoptions('intlinprog','TolInteger',1e-6, 'TolGapRel', 1e-18);
[x,fval,exitflag,output] = intlinprog(f,intcon,A,b,Aeq,beq,lb,ub,options);

%% **********************************************************************************************************************************************************
% Plot results
n = 1:N;

pgplus = x(1:N,1);
pgminus = x(N+1:2*N,1);
pgnet = pgplus-pgminus;
pbplus = x((2*N)+1:3*N,1);
pbminus = x((3*N)+1:4*N,1);
pbnet = pbplus-pbminus;
pbg = x((4*N)+1:5*N,1);
pbd = x((5*N)+1:6*N,1);
dg = x((6*N)+1:7*N,1);
dpv = x((7*N)+1:8*N,1);
sb = x((8*N)+1:9*N,1);
eb = x((9*N)+1:10*N,1);

%%
fig1 = figure;
fig1.Units = 'centimeters';
fig1.Position = [10   10   16   11.1125];
fig1.Color = 'white'; % set(gcf,'color','white')
 
subplot(3,2,1)
stairs(n,pgnet)
title('Grid power')
ax = gca; ax.FontSize = 8; ax.XTickLabel = {'0','6','12','18','24'}; ax.XTick = NN*2*[0 6 12 18 24];
ax.XLim = [1 2*NN*24]; ax.YLim = [0 4]; ax.Box = 'on'; ax.Color = 'white';
xlabel('Hours')
ylabel('{\itP} (kW)')

subplot(3,2,2)
plot(n,eb);
title('Baterry state of charge')
ax = gca; ax.FontSize = 8; ax.XTickLabel = {'0','6','12','18','24'}; ax.XTick = NN*2*[0 6 12 18 24];
ax.XLim = [1 2*NN*24]; ax.YLim = [0 14]; ax.Box = 'on'; ax.Color = 'white';
xlabel('Hours')
ylabel('{\itE} (kWh)')

subplot(3,2,3); hold on
stairs(n,pbplus);
stairs(n,pbminus);
title('Battery charge/discharge power')
ax = gca; ax.FontSize = 8; ax.XTickLabel = {'0','6','12','18','24'}; ax.XTick = NN*2*[0 6 12 18 24];
ax.XLim = [1 2*NN*24]; ax.YLim = [0 5]; ax.Box = 'on'; ax.Color = 'white';
xlabel('Hours')
ylabel('{\itP} (kW)')
legend('charge','discharge')

subplot(3,2,4)
plot(n,PD)
title('Electrical demand')
ax = gca; ax.FontSize = 8; ax.XTickLabel = {'0','6','12','18','24'}; ax.XTick = NN*2*[0 6 12 18 24];
ax.XLim = [1 2*NN*24]; ax.YLim = [0 2]; ax.Box = 'on'; ax.Color = 'white';
xlabel('Hours')
ylabel('{\itP} (kW)')

subplot(3,2,5)
plot(n,PV)
title('PV output')
ax = gca; ax.FontSize = 8; ax.XTickLabel = {'0','6','12','18','24'}; ax.XTick = NN*2*[0 6 12 18 24];
ax.XLim = [1 2*NN*24]; ax.YLim = [0 1.6]; ax.Box = 'on'; ax.Color = 'white';
xlabel('Hours')
ylabel('{\itP} (kW)')

RetT = xlsread(input_file,'','D2:D49')'; % Retail electricity tariff
subplot(3,2,6)
stairs(RetT)
title('Retail tariff')
ax = gca; ax.FontSize = 8; ax.XTickLabel = {'0','6','12','18','24'}; ax.XTick = 2*[0 6 12 18 24];
ax.XLim = [1 2*24]; ax.YLim = [0 0.5]; ax.Box = 'on'; ax.Color = 'white';
xlabel('Hours')
ylabel('{\itc} ($/kWh)')

saveas(fig1, 'house_variables.fig');
% export_fig house_variables.pdf

%%
fig2 = figure;
fig2.Units = 'centimeters';
fig2.Position = [5   5   16   16];
fig2.Color = 'white'; % set(gcf,'color','white')

subplot(5,2,1)
stairs(n,pgplus)
title('Power flowing from grid')
ax = gca; ax.FontSize = 8; ax.XTickLabel = {'0','6','12','18','24'}; ax.XTick = NN*2*[0 6 12 18 24];
ax.XLim = [1 2*NN*24]; ax.YLim = [-0.1 4]; ax.Box = 'on'; ax.Color = 'white';
xlabel('Hours')
ylabel('{\itP} (kW)')

subplot(5,2,2)
stairs(n,pgminus)
title('Power flowing to grid')
ax = gca; ax.FontSize = 8; ax.XTickLabel = {'0','6','12','18','24'}; ax.XTick = NN*2*[0 6 12 18 24];
ax.XLim = [1 2*NN*24]; ax.YLim = [-0.1 4]; ax.Box = 'on'; ax.Color = 'white';
xlabel('Hours')
ylabel('{\itP} (kW)')

subplot(5,2,3)
stairs(n,pbplus)
title('Battery charge power')
ax = gca; ax.FontSize = 8; ax.XTickLabel = {'0','6','12','18','24'}; ax.XTick = NN*2*[0 6 12 18 24];
ax.XLim = [1 2*NN*24]; ax.YLim = [-0.1 4]; ax.Box = 'on'; ax.Color = 'white';
xlabel('Hours')
ylabel('{\itP} (kW)')

subplot(5,2,4)
stairs(n,pbminus)
title('Battery discharge power')
ax = gca; ax.FontSize = 8; ax.XTickLabel = {'0','6','12','18','24'}; ax.XTick = NN*2*[0 6 12 18 24];
ax.XLim = [1 2*NN*24]; ax.YLim = [-0.1 4]; ax.Box = 'on'; ax.Color = 'white';
xlabel('Hours')
ylabel('{\itP} (kW)')

subplot(5,2,5)
stairs(n,pbd)
title('Power flowing from battery to demand')
ax = gca; ax.FontSize = 8; ax.XTickLabel = {'0','6','12','18','24'}; ax.XTick = NN*2*[0 6 12 18 24];
ax.XLim = [1 2*NN*24]; ax.YLim = [-0.1 4]; ax.Box = 'on'; ax.Color = 'white';
xlabel('Hours')
ylabel('{\itP} (kW)')

subplot(5,2,6)
stairs(n,pbg)
title('Power flowing from battery to grid')
ax = gca; ax.FontSize = 8; ax.XTickLabel = {'0','6','12','18','24'}; ax.XTick = NN*2*[0 6 12 18 24];
ax.XLim = [1 2*NN*24]; ax.YLim = [-0.1 4]; ax.Box = 'on'; ax.Color = 'white';
xlabel('Hours')
ylabel('{\itP} (kW)')

subplot(5,2,7)
stairs(n,eb)
title('Battery state of charge')
ax = gca; ax.FontSize = 8; ax.XTickLabel = {'0','6','12','18','24'}; ax.XTick = NN*2*[0 6 12 18 24];
ax.XLim = [1 2*NN*24]; ax.YLim = [-0.1 14]; ax.Box = 'on'; ax.Color = 'white';
xlabel('Hours')
ylabel('{\itE} (kWh)')

subplot(5,2,8)
stairs(n,sb)
title('Battery charging status')
ax = gca; ax.FontSize = 8; ax.XTickLabel = {'0','6','12','18','24'}; ax.XTick = NN*2*[0 6 12 18 24];
ax.XLim = [1 2*NN*24]; ax.YLim = [-0.1 1.1]; ax.Box = 'on'; ax.Color = 'white';
xlabel('Hours')
ylabel('0/1')

subplot(5,2,9)
stairs(n,dg)
title('Direction of grid power flow')
ax = gca; ax.FontSize = 8; ax.XTickLabel = {'0','6','12','18','24'}; ax.XTick = NN*2*[0 6 12 18 24];
ax.XLim = [1 2*NN*24]; ax.YLim = [-0.1 1.1]; ax.Box = 'on'; ax.Color = 'white';
xlabel('Hours')
ylabel('0/1')

subplot(5,2,10)
stairs(n,dpv)
title('Direction of power flow from PV')
ax = gca; ax.FontSize = 8; ax.XTickLabel = {'0','6','12','18','24'}; ax.XTick = NN*2*[0 6 12 18 24];
ax.XLim = [1 2*NN*24]; ax.YLim = [-0.1 1.1]; ax.Box = 'on'; ax.Color = 'white';
xlabel('Hours')
ylabel('0/1')

saveas(fig2, 'decision_variables.fig');
% export_fig decision_variables.pdf
%%
fig3 = figure; hold on;
fig3.Units = 'centimeters';
fig3.Position = [10   10   16   8];
fig3.Color = 'white'; % set(gcf,'color','white')

ax = gca; % current axes
ax.FontSize = 8;
ax.XTickLabel = {'0','6','12','18','24'};
ax.XTick = NN*2*[0 6 12 18 24];
ax.XLim = [1 2*NN*24];
ax.YLim = [0 2];
ax.Box = 'on';
ax.Color = 'white'; % set(gca,'color','white')

from_grid = pgplus - etaI*pbplus;
from_grid(from_grid<0) = 0;
from_battery = etaB*etaI*pbd;
from_pv = PD' - from_grid - from_battery;
pv_battery = etaI*PV' - PD' - pbd;
pv_battery(pv_battery<0) = 0;
total_demand = [from_grid,from_battery,from_pv,pv_battery];
area_stairs(n', total_demand)
PV(PV<0) = 0;

stairs(n,PV)
stairs(n,from_pv)
title('Household electrical demand')
xlabel('Hours')
ylabel('{\itP} (kW)')
source = {'From Grid','From Battery','From PV','PV to Battery','PV','PV to Demand'};
legend(source, 'Location', 'NorthWest')
colormap summer

saveas(fig3, 'house_demand.fig');
% export_fig house_demand.pdf