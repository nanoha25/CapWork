function mpc = captd_case_30
%CAP_CASE  Power flow data for multi-home one-generation system

%   MATPOWER

%% MATPOWER Case Format : Version 2
mpc.version = '2';

%%-----  Power Flow Data  -----%%
%% system MVA base
mpc.baseMVA = 100;

%% bus data
%	bus_i	type	Pd	Qd	Gs	Bs	area	Vm	Va	baseKV	zone	Vmax	Vmin
mpc.bus = [
    1	3	0	0	0	0	1	1	0	230	1	1.1	0.9;
	2	2	6.025	1.9804	0	0	1	1	0	230	1	1.1	0.9;
	3	2	12.050	3.9608	0	0	1	1	0	230	1	1.1	0.9;
    4   2   6.025   1.9804  0   0   1   1   0   230 1   1.1 0.9;
    5   2   6.025   1.9804  0   0   1   1   0   230 1   1.1 0.9;
    6   2   6.025   1.9804  0   0   1   1   0   230 1   1.1 0.9;
    7   2   6.025   1.9804  0   0   1   1   0   230 1   1.1 0.9;
    8   2   6.025   1.9804  0   0   1   1   0   230 1   1.1 0.9;
    9   2   6.025   1.9804  0   0   1   1   0   230 1   1.1 0.9;
    10   2   6.025   1.9804  0   0   1   1   0   230 1   1.1 0.9;
    11   2   6.025   1.9804  0   0   1   1   0   230 1   1.1 0.9;
    12	 1	 6.025	 1.9804	 0	 0	 1	 1	 0	 230 1	 1.1 0.9;
	13	 1	 12.050	 3.9608	 0	 0	 1	 1	 0	 230 1	 1.1 0.9;
    14   1   6.025   1.9804  0   0   1   1   0   230 1   1.1 0.9;
    15   1   6.025   1.9804  0   0   1   1   0   230 1   1.1 0.9;
    16   1   6.025   1.9804  0   0   1   1   0   230 1   1.1 0.9;
    17   1   6.025   1.9804  0   0   1   1   0   230 1   1.1 0.9;
    18   1   6.025   1.9804  0   0   1   1   0   230 1   1.1 0.9;
    19   1   6.025   1.9804  0   0   1   1   0   230 1   1.1 0.9;
    20   1   6.025   1.9804  0   0   1   1   0   230 1   1.1 0.9;
    21   1   6.025   1.9804  0   0   1   1   0   230 1   1.1 0.9;
    22	 1	 6.025	 1.9804	 0	 0	 1	 1	 0	 230 1	 1.1 0.9;
	23	 1	 12.050	 3.9608	 0	 0	 1	 1	 0	 230 1	 1.1 0.9;
    24   1   6.025   1.9804  0   0   1   1   0   230 1   1.1 0.9;
    25   1   6.025   1.9804  0   0   1   1   0   230 1   1.1 0.9;
    26   1   6.025   1.9804  0   0   1   1   0   230 1   1.1 0.9;
    27   1   6.025   1.9804  0   0   1   1   0   230 1   1.1 0.9;
    28   1   6.025   1.9804  0   0   1   1   0   230 1   1.1 0.9;
    29   1   6.025   1.9804  0   0   1   1   0   230 1   1.1 0.9;
    30   1   6.025   1.9804  0   0   1   1   0   230 1   1.1 0.9;
    31   1   6.025   1.9804  0   0   1   1   0   230 1   1.1 0.9;    
    
];

%% generator data
%	bus	Pg	    Qg	Qmax	Qmin	Vg	mBase	status	Pmax	Pmin	Pc1	Pc2	Qc1min	Qc1max	Qc2min	Qc2max	ramp_agc	ramp_10	ramp_30	ramp_q	apf
mpc.gen = [
	1	500 	0	300	    -300	1	100     1	20000	   0	0	0	0	0	0	0	0	0	0	0	0;
	2	7 	0	300	    -300	1	100     1	500	   0	0	0	0	0	0	0	0	0	0	0	0; 
	3	8 	0	300	    -300	1	100     1	500	   0	0	0	0	0	0	0	0	0	0	0	0;
	4	12 	0	300	    -300	1	100     1	500	   0	0	0	0	0	0	0	0	0	0	0	0;    
    5	12 	0	300	    -300	1	100     1	500	   0	0	0	0	0	0	0	0	0	0	0	0;    
    6	12 	0	300	    -300	1	100     1	500	   0	0	0	0	0	0	0	0	0	0	0	0;    
    7	12 	0	300	    -300	1	100     1	500    0	0	0	0	0	0	0	0	0	0	0	0;    
    8	12 	0	300	    -300	1	100     1	500	   0	0	0	0	0	0	0	0	0	0	0	0;    
    9	12 	0	300	    -300	1	100     1	500	   0	0	0	0	0	0	0	0	0	0	0	0;    
    10	12 	0	300	    -300	1	100     1	500	   0	0	0	0	0	0	0	0	0	0	0	0;    
    11	12 	0	300	    -300	1	100     1	500	   0	0	0	0	0	0	0	0	0	0	0	0; 
];

%% branch data
%	fbus	tbus	r	x	b	rateA	rateB	rateC	ratio	angle	status	angmin	angmax
mpc.branch = [
	1	2	0.00281	0.0281	0.00712	0	0	0	0	0	1	-360	360;
	1	3	0.00297	0.0297	0.00674	0	0	0	0	0	1	-360	360;
    1   4   0.00342	0.0342	0.00875	0	0	0	0	0	1	-360	360;
    1   5   0.00330	0.0285	0.00952	0	0	0	0	0	1	-360	360;
    1   6   0.00299	0.0245	0.00685	0	0	0	0	0	1	-360	360;
    1   7   0.00330	0.0300	0.00725	0	0	0	0	0	1	-360	360;
    1   8   0.00785	0.0452	0.00486	0	0	0	0	0	1	-360	360;
    1   9   0.00452	0.0741	0.00985	0	0	0	0	0	1	-360	360;
    1   10   0.00410	0.0470	0.00743	    0	0	0	0	0	1	-360	360;
    1   11   0.00562	0.0561	0.00886	    0	0	0	0	0	1	-360	360;
	1	12	 0.00281	0.0281	0.00712     0	0	0	0	0	1	-360	360;
	1	13	 0.00297	0.0297	0.00674     0	0	0	0	0	1	-360	360;
    1   14   0.00342	0.0342	0.00875     0	0	0	0	0	1	-360	360;
    1   15   0.00330	0.0285	0.00952     0	0	0	0	0	1	-360	360;
    1   16   0.00299	0.0245	0.00685     0	0	0	0	0	1	-360	360;
    1   17   0.00330	0.0300	0.00725     0	0	0	0	0	1	-360	360;
    1   18   0.00785	0.0452	0.00486     0	0	0	0	0	1	-360	360;
    1   19   0.00452	0.0741	0.00985     0	0	0	0	0	1	-360	360;
    1   20   0.00410	0.0470	0.00743	    0	0	0	0	0	1	-360	360;
    1   21   0.00562	0.0561	0.00886	    0	0	0	0	0	1	-360	360;   
	1	22	 0.00281	0.0281	0.00712     0	0	0	0	0	1	-360	360;
	1	23	 0.00297	0.0297	0.00674     0	0	0	0	0	1	-360	360;
    1   24   0.00342	0.0342	0.00875     0	0	0	0	0	1	-360	360;
    1   25   0.00330	0.0285	0.00952     0	0	0	0	0	1	-360	360;
    1   26   0.00299	0.0245	0.00685     0	0	0	0	0	1	-360	360;
    1   27   0.00330	0.0300	0.00725     0	0	0	0	0	1	-360	360;
    1   28   0.00785	0.0452	0.00486     0	0	0	0	0	1	-360	360;
    1   29   0.00452	0.0741	0.00985     0	0	0	0	0	1	-360	360;
    1   30   0.00410	0.0470	0.00743	    0	0	0	0	0	1	-360	360;
    1   31   0.00562	0.0561	0.00886	    0	0	0	0	0	1	-360	360;     
	2	3	0.00102	0.0102	0.04123	0	0	0	0	0	1	-360	360;
    3   4   0.00058	0.0058	0.07582	0	0	0	0	0	1	-360	360;
    4   5   0.00025	0.0421	0.00356	0	0	0	0	0	1	-360	360;
    5   6   0.00123	0.0980	0.00778	0	0	0	0	0	1	-360	360;
    6   7   0.00052	0.0432	0.00875	0	0	0	0	0	1	-360	360;
    7   8   0.00047	0.0703	0.04123	0	0	0	0	0	1	-360	360;
    8   9   0.00058	0.0889	0.05582	0	0	0	0	0	1	-360	360;
    9   10    0.00120	0.0120	0.01026 	0	0	0	0	0	1	-360	360;
    10   11   0.00120	0.0120	0.01026 	0	0	0	0	0	1	-360	360;
];

