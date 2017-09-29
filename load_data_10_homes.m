clc
clear all
%Load data from table

input_file = 'cap_data.xlsx';  
%Load profile for solar homes
load1_GC = xlsread(input_file,'Monthly 10 homes 2','B4:B15')'; %Customer 40 monthly general consumption 
load2_GC = xlsread(input_file,'Monthly 10 homes 2','C4:C15')'; %Customer 41 monthly general consumption
load3_GC = xlsread(input_file,'Monthly 10 homes 2','D4:D15')'; %Customer 42 monthly general consumption
load4_GC = xlsread(input_file,'Monthly 10 homes 2','E4:E15')'; %Customer 43 monthly general consumption
load5_GC = xlsread(input_file,'Monthly 10 homes 2','F4:F15')'; %Customer 44 monthly general consumption
load6_GC = xlsread(input_file,'Monthly 10 homes 2','G4:G15')'; %Customer 45 monthly general consumption
load7_GC = xlsread(input_file,'Monthly 10 homes 2','H4:H15')'; %Customer 46 monthly general consumption
load8_GC = xlsread(input_file,'Monthly 10 homes 2','I4:I15')'; %Customer 47 monthly general consumption
load9_GC = xlsread(input_file,'Monthly 10 homes 2','J4:J15')'; %Customer 48 monthly general consumption
load10_GC = xlsread(input_file,'Monthly 10 homes 2','K4:K15')'; %Customer 49 monthly general consumption

load1_GG = xlsread(input_file,'Monthly 10 homes 2','B18:B29')'; %Customer 40 monthly gross generation
load2_GG = xlsread(input_file,'Monthly 10 homes 2','C18:C29')'; %Customer 41 monthly gross generation
load3_GG = xlsread(input_file,'Monthly 10 homes 2','D18:D29')'; %Customer 42 monthly gross generation
load4_GG = xlsread(input_file,'Monthly 10 homes 2','E18:E29')'; %Customer 43 monthly gross generation
load5_GG = xlsread(input_file,'Monthly 10 homes 2','F18:F29')'; %Customer 44 monthly gross generation
load6_GG = xlsread(input_file,'Monthly 10 homes 2','G18:G29')'; %Customer 45 monthly gross generation
load7_GG = xlsread(input_file,'Monthly 10 homes 2','H18:H29')'; %Customer 46 monthly gross generation
load8_GG = xlsread(input_file,'Monthly 10 homes 2','I18:I29')'; %Customer 47 monthly gross generation
load9_GG = xlsread(input_file,'Monthly 10 homes 2','J18:J29')'; %Customer 48 monthly gross generation
load10_GG = xlsread(input_file,'Monthly 10 homes 2','K18:K29')'; %Customer 49 monthly gross generation

%Load profile for non-solar homes
load11_GC = xlsread(input_file,'Monthly 10 homes 2','N4:N15')'; %Customer 70 monthly general consumption 
load12_GC = xlsread(input_file,'Monthly 10 homes 2','O4:O15')'; %Customer 71 monthly general consumption
load13_GC = xlsread(input_file,'Monthly 10 homes 2','P4:P15')'; %Customer 72 monthly general consumption
load14_GC = xlsread(input_file,'Monthly 10 homes 2','Q4:Q15')'; %Customer 73 monthly general consumption
load15_GC = xlsread(input_file,'Monthly 10 homes 2','R4:R15')'; %Customer 74 monthly general consumption
load16_GC = xlsread(input_file,'Monthly 10 homes 2','S4:S15')'; %Customer 75 monthly general consumption
load17_GC = xlsread(input_file,'Monthly 10 homes 2','T4:T15')'; %Customer 76 monthly general consumption
load18_GC = xlsread(input_file,'Monthly 10 homes 2','U4:U15')'; %Customer 77 monthly general consumption
load19_GC = xlsread(input_file,'Monthly 10 homes 2','V4:V15')'; %Customer 78 monthly general consumption
load20_GC = xlsread(input_file,'Monthly 10 homes 2','W4:W15')'; %Customer 79 monthly general consumption

N = length(load1_GC);

% calculate power flow and save result of each calculation to an individual
% file

i = 1;
while(i<N+1)
    define_constants;
    mpc = loadcase('captd_case.m');
    %buses for solar homes
    mpc.bus(2, PD) = load1_GC(1,i);
    mpc.bus(2, QD) = 0.3286*load1_GC(1,i);
    mpc.bus(3, PD) = load2_GC(1,i);
    mpc.bus(3, QD) = 0.3286*load2_GC(1,i);
    mpc.bus(4, PD) = load3_GC(1,i);
    mpc.bus(4, QD) = 0.3286*load3_GC(1,i);
    mpc.bus(5, PD) = load4_GC(1,i);
    mpc.bus(5, QD) = 0.3286*load4_GC(1,i);
    mpc.bus(6, PD) = load5_GC(1,i);
    mpc.bus(6, QD) = 0.3286*load5_GC(1,i);
    mpc.bus(7, PD) = load6_GC(1,i);
    mpc.bus(7, QD) = 0.3286*load6_GC(1,i);
    mpc.bus(8, PD) = load7_GC(1,i);
    mpc.bus(8, QD) = 0.3286*load7_GC(1,i);
    mpc.bus(9, PD) = load8_GC(1,i);
    mpc.bus(9, QD) = 0.3286*load8_GC(1,i);
    mpc.bus(10, PD) = load9_GC(1,i);
    mpc.bus(10, QD) = 0.3286*load9_GC(1,i);
    mpc.bus(11, PD) = load10_GC(1,i);
    mpc.bus(11, QD) = 0.3286*load10_GC(1,i);
    
    %generation for solar homes
    mpc.gen(2, PG) = load1_GG(1,i);
    mpc.gen(2, QG) = 0.1021*load1_GG(1,i);
    mpc.gen(3, PG) = load2_GG(1,i);
    mpc.gen(3, QG) = 0.1021*load2_GG(1,i);
    mpc.gen(4, PG) = load3_GG(1,i);
    mpc.gen(4, QG) = 0.1021*load3_GG(1,i);
    mpc.gen(5, PG) = load4_GG(1,i);
    mpc.gen(5, QG) = 0.1021*load4_GG(1,i);
    mpc.gen(6, PG) = load5_GG(1,i);
    mpc.gen(6, QG) = 0.1021*load5_GG(1,i);
    mpc.gen(7, PG) = load6_GG(1,i);
    mpc.gen(7, QG) = 0.1021*load6_GG(1,i);
    mpc.gen(8, PG) = load7_GG(1,i);
    mpc.gen(8, QG) = 0.1021*load7_GG(1,i);
    mpc.gen(9, PG) = load8_GG(1,i);
    mpc.gen(9, QG) = 0.1021*load8_GG(1,i);
    mpc.gen(10, PG) = load9_GG(1,i);
    mpc.gen(10, QG) = 0.1021*load9_GG(1,i);
    mpc.gen(11, PG) = load10_GG(1,i);
    mpc.gen(11, QG) = 0.1021*load10_GG(1,i);
    
    %buses for non-solar homes
    mpc.bus(12, PD) = load11_GC(1,i);
    mpc.bus(12, QD) = 0.3286*load11_GC(1,i);
    mpc.bus(13, PD) = load12_GC(1,i);
    mpc.bus(13, QD) = 0.3286*load12_GC(1,i);
    mpc.bus(14, PD) = load13_GC(1,i);
    mpc.bus(14, QD) = 0.3286*load13_GC(1,i);
    mpc.bus(15, PD) = load14_GC(1,i);
    mpc.bus(15, QD) = 0.3286*load14_GC(1,i);
    mpc.bus(16, PD) = load15_GC(1,i);
    mpc.bus(16, QD) = 0.3286*load15_GC(1,i);
    mpc.bus(17, PD) = load16_GC(1,i);
    mpc.bus(17, QD) = 0.3286*load16_GC(1,i);
    mpc.bus(18, PD) = load17_GC(1,i);
    mpc.bus(18, QD) = 0.3286*load17_GC(1,i);
    mpc.bus(19, PD) = load18_GC(1,i);
    mpc.bus(19, QD) = 0.3286*load18_GC(1,i);
    mpc.bus(20, PD) = load19_GC(1,i);
    mpc.bus(20, QD) = 0.3286*load19_GC(1,i);
    mpc.bus(21, PD) = load20_GC(1,i);
    mpc.bus(21, QD) = 0.3286*load20_GC(1,i);
    
    
    D = ['This is case ',num2str(i)];
    disp(D); %some output fine-tune
    result = runpf(mpc);
    sps = ['End of case ',num2str(i)]; %some output fine-tune
    disp(sps); 
    disp('-----------------------');
    filename = ['Cus_mo_' num2str(i) '.mat'];
    save(filename,'result');
    i = i + 1;
end
