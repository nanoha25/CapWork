clc
clear all
%Load data from table

input_file = 'cap_data.xlsx';  
%Load profile for gross generation
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

load11_GG = xlsread(input_file,'Monthly 10 homes 2','L18:B29')'; %Customer 40 monthly gross generation
load12_GG = xlsread(input_file,'Monthly 10 homes 2','M18:C29')'; %Customer 41 monthly gross generation
load13_GG = xlsread(input_file,'Monthly 10 homes 2','N18:D29')'; %Customer 42 monthly gross generation
load14_GG = xlsread(input_file,'Monthly 10 homes 2','O18:E29')'; %Customer 43 monthly gross generation
load15_GG = xlsread(input_file,'Monthly 10 homes 2','P18:F29')'; %Customer 44 monthly gross generation
load16_GG = xlsread(input_file,'Monthly 10 homes 2','Q18:G29')'; %Customer 45 monthly gross generation
load17_GG = xlsread(input_file,'Monthly 10 homes 2','R18:H29')'; %Customer 46 monthly gross generation
load18_GG = xlsread(input_file,'Monthly 10 homes 2','S18:I29')'; %Customer 47 monthly gross generation
load19_GG = xlsread(input_file,'Monthly 10 homes 2','T18:J29')'; %Customer 48 monthly gross generation
load20_GG = xlsread(input_file,'Monthly 10 homes 2','U18:K29')'; %Customer 49 monthly gross generation

load21_GG = xlsread(input_file,'Monthly 10 homes 2','V18:B29')'; %Customer 40 monthly gross generation
load22_GG = xlsread(input_file,'Monthly 10 homes 2','W18:C29')'; %Customer 41 monthly gross generation
load23_GG = xlsread(input_file,'Monthly 10 homes 2','X18:D29')'; %Customer 42 monthly gross generation
load24_GG = xlsread(input_file,'Monthly 10 homes 2','Y18:E29')'; %Customer 43 monthly gross generation
load25_GG = xlsread(input_file,'Monthly 10 homes 2','Z18:F29')'; %Customer 44 monthly gross generation
load26_GG = xlsread(input_file,'Monthly 10 homes 2','AA18:G29')'; %Customer 45 monthly gross generation
load27_GG = xlsread(input_file,'Monthly 10 homes 2','AB18:H29')'; %Customer 46 monthly gross generation
load28_GG = xlsread(input_file,'Monthly 10 homes 2','AC18:I29')'; %Customer 47 monthly gross generation
load29_GG = xlsread(input_file,'Monthly 10 homes 2','AD18:J29')'; %Customer 48 monthly gross generation
load30_GG = xlsread(input_file,'Monthly 10 homes 2','AE18:K29')'; %Customer 49 monthly gross generation

load31_GG = xlsread(input_file,'Monthly 10 homes 2','AF18:B29')'; %Customer 40 monthly gross generation
load32_GG = xlsread(input_file,'Monthly 10 homes 2','AG18:C29')'; %Customer 41 monthly gross generation
load33_GG = xlsread(input_file,'Monthly 10 homes 2','AH18:D29')'; %Customer 42 monthly gross generation
load34_GG = xlsread(input_file,'Monthly 10 homes 2','AI18:E29')'; %Customer 43 monthly gross generation
load35_GG = xlsread(input_file,'Monthly 10 homes 2','AJ18:F29')'; %Customer 44 monthly gross generation
load36_GG = xlsread(input_file,'Monthly 10 homes 2','AK18:G29')'; %Customer 45 monthly gross generation
load37_GG = xlsread(input_file,'Monthly 10 homes 2','AL18:H29')'; %Customer 46 monthly gross generation
load38_GG = xlsread(input_file,'Monthly 10 homes 2','AM18:I29')'; %Customer 47 monthly gross generation
load39_GG = xlsread(input_file,'Monthly 10 homes 2','AN18:J29')'; %Customer 48 monthly gross generation
load40_GG = xlsread(input_file,'Monthly 10 homes 2','AO18:K29')'; %Customer 49 monthly gross generation

load41_GG = xlsread(input_file,'Monthly 10 homes 2','AP18:B29')'; %Customer 40 monthly gross generation
load42_GG = xlsread(input_file,'Monthly 10 homes 2','AQ18:C29')'; %Customer 41 monthly gross generation
load43_GG = xlsread(input_file,'Monthly 10 homes 2','AR18:D29')'; %Customer 42 monthly gross generation
load44_GG = xlsread(input_file,'Monthly 10 homes 2','AS18:E29')'; %Customer 43 monthly gross generation
load45_GG = xlsread(input_file,'Monthly 10 homes 2','AT18:F29')'; %Customer 44 monthly gross generation
load46_GG = xlsread(input_file,'Monthly 10 homes 2','AW18:G29')'; %Customer 45 monthly gross generation
load47_GG = xlsread(input_file,'Monthly 10 homes 2','AX18:H29')'; %Customer 46 monthly gross generation
load48_GG = xlsread(input_file,'Monthly 10 homes 2','AY18:I29')'; %Customer 47 monthly gross generation
load49_GG = xlsread(input_file,'Monthly 10 homes 2','AZ18:J29')'; %Customer 48 monthly gross generation
load50_GG = xlsread(input_file,'Monthly 10 homes 2','BA18:K29')'; %Customer 49 monthly gross generation

load51_GG = xlsread(input_file,'Monthly 10 homes 2','BB18:B29')'; %Customer 40 monthly gross generation
load52_GG = xlsread(input_file,'Monthly 10 homes 2','BC18:C29')'; %Customer 41 monthly gross generation
load53_GG = xlsread(input_file,'Monthly 10 homes 2','BD18:D29')'; %Customer 42 monthly gross generation
load54_GG = xlsread(input_file,'Monthly 10 homes 2','BE18:E29')'; %Customer 43 monthly gross generation
load55_GG = xlsread(input_file,'Monthly 10 homes 2','BF18:F29')'; %Customer 44 monthly gross generation
load56_GG = xlsread(input_file,'Monthly 10 homes 2','BG18:G29')'; %Customer 45 monthly gross generation
load57_GG = xlsread(input_file,'Monthly 10 homes 2','BH18:H29')'; %Customer 46 monthly gross generation
load58_GG = xlsread(input_file,'Monthly 10 homes 2','BI18:I29')'; %Customer 47 monthly gross generation
load59_GG = xlsread(input_file,'Monthly 10 homes 2','BJ18:J29')'; %Customer 48 monthly gross generation
load60_GG = xlsread(input_file,'Monthly 10 homes 2','BK18:K29')'; %Customer 49 monthly gross generation

load61_GG = xlsread(input_file,'Monthly 10 homes 2','BL18:B29')'; %Customer 40 monthly gross generation
load62_GG = xlsread(input_file,'Monthly 10 homes 2','BM18:C29')'; %Customer 41 monthly gross generation
load63_GG = xlsread(input_file,'Monthly 10 homes 2','BN18:D29')'; %Customer 42 monthly gross generation
load64_GG = xlsread(input_file,'Monthly 10 homes 2','BO18:E29')'; %Customer 43 monthly gross generation
load65_GG = xlsread(input_file,'Monthly 10 homes 2','BP18:F29')'; %Customer 44 monthly gross generation
load66_GG = xlsread(input_file,'Monthly 10 homes 2','BQ18:G29')'; %Customer 45 monthly gross generation
load67_GG = xlsread(input_file,'Monthly 10 homes 2','BR18:H29')'; %Customer 46 monthly gross generation
load68_GG = xlsread(input_file,'Monthly 10 homes 2','BS18:I29')'; %Customer 47 monthly gross generation
load69_GG = xlsread(input_file,'Monthly 10 homes 2','BT18:J29')'; %Customer 48 monthly gross generation
load70_GG = xlsread(input_file,'Monthly 10 homes 2','BU18:K29')'; %Customer 49 monthly gross generation

load71_GG = xlsread(input_file,'Monthly 10 homes 2','BV18:B29')'; %Customer 40 monthly gross generation
load72_GG = xlsread(input_file,'Monthly 10 homes 2','BW18:C29')'; %Customer 41 monthly gross generation
load73_GG = xlsread(input_file,'Monthly 10 homes 2','BX18:D29')'; %Customer 42 monthly gross generation
load74_GG = xlsread(input_file,'Monthly 10 homes 2','BY18:E29')'; %Customer 43 monthly gross generation
load75_GG = xlsread(input_file,'Monthly 10 homes 2','BZ18:F29')'; %Customer 44 monthly gross generation
load76_GG = xlsread(input_file,'Monthly 10 homes 2','CA18:G29')'; %Customer 45 monthly gross generation
load77_GG = xlsread(input_file,'Monthly 10 homes 2','CB18:H29')'; %Customer 46 monthly gross generation
load78_GG = xlsread(input_file,'Monthly 10 homes 2','CC18:I29')'; %Customer 47 monthly gross generation
load79_GG = xlsread(input_file,'Monthly 10 homes 2','CD18:J29')'; %Customer 48 monthly gross generation
load80_GG = xlsread(input_file,'Monthly 10 homes 2','CE18:K29')'; %Customer 49 monthly gross generation

load81_GG = xlsread(input_file,'Monthly 10 homes 2','CF18:B29')'; %Customer 40 monthly gross generation
load82_GG = xlsread(input_file,'Monthly 10 homes 2','CG18:C29')'; %Customer 41 monthly gross generation
load83_GG = xlsread(input_file,'Monthly 10 homes 2','CH18:D29')'; %Customer 42 monthly gross generation
load84_GG = xlsread(input_file,'Monthly 10 homes 2','CI18:E29')'; %Customer 43 monthly gross generation
load85_GG = xlsread(input_file,'Monthly 10 homes 2','CJ18:F29')'; %Customer 44 monthly gross generation
load86_GG = xlsread(input_file,'Monthly 10 homes 2','CK18:G29')'; %Customer 45 monthly gross generation
load87_GG = xlsread(input_file,'Monthly 10 homes 2','CL18:H29')'; %Customer 46 monthly gross generation
load88_GG = xlsread(input_file,'Monthly 10 homes 2','CM18:I29')'; %Customer 47 monthly gross generation
load89_GG = xlsread(input_file,'Monthly 10 homes 2','CN18:J29')'; %Customer 48 monthly gross generation
load90_GG = xlsread(input_file,'Monthly 10 homes 2','CO18:K29')'; %Customer 49 monthly gross generation

load91_GG = xlsread(input_file,'Monthly 10 homes 2','CP18:B29')'; %Customer 40 monthly gross generation
load92_GG = xlsread(input_file,'Monthly 10 homes 2','CQ18:C29')'; %Customer 41 monthly gross generation
load93_GG = xlsread(input_file,'Monthly 10 homes 2','CR18:D29')'; %Customer 42 monthly gross generation
load94_GG = xlsread(input_file,'Monthly 10 homes 2','CS18:E29')'; %Customer 43 monthly gross generation
load95_GG = xlsread(input_file,'Monthly 10 homes 2','CT18:F29')'; %Customer 44 monthly gross generation
load96_GG = xlsread(input_file,'Monthly 10 homes 2','CU18:G29')'; %Customer 45 monthly gross generation
load97_GG = xlsread(input_file,'Monthly 10 homes 2','CV18:H29')'; %Customer 46 monthly gross generation
load98_GG = xlsread(input_file,'Monthly 10 homes 2','CW18:I29')'; %Customer 47 monthly gross generation
load99_GG = xlsread(input_file,'Monthly 10 homes 2','CX18:J29')'; %Customer 48 monthly gross generation
load100_GG = xlsread(input_file,'Monthly 10 homes 2','CY18:K29')'; %Customer 49 monthly gross generation

% Load profile for general consumption
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

load21_GC = xlsread(input_file,'Monthly 10 homes 2','Z4:Z15')'; %Customer 60 monthly general consumption 
load22_GC = xlsread(input_file,'Monthly 10 homes 2','AA4:AA15')'; %Customer 61 monthly general consumption
load23_GC = xlsread(input_file,'Monthly 10 homes 2','AB4:AB15')'; %Customer 62 monthly general consumption
load24_GC = xlsread(input_file,'Monthly 10 homes 2','AC4:AC15')'; %Customer 63 monthly general consumption
load25_GC = xlsread(input_file,'Monthly 10 homes 2','AD4:AD15')'; %Customer 64 monthly general consumption
load26_GC = xlsread(input_file,'Monthly 10 homes 2','AE4:AE15')'; %Customer 65 monthly general consumption
load27_GC = xlsread(input_file,'Monthly 10 homes 2','AF4:AF15')'; %Customer 66 monthly general consumption
load28_GC = xlsread(input_file,'Monthly 10 homes 2','AG4:AG15')'; %Customer 67 monthly general consumption
load29_GC = xlsread(input_file,'Monthly 10 homes 2','AH4:AH15')'; %Customer 68 monthly general consumption
load30_GC = xlsread(input_file,'Monthly 10 homes 2','AI4:AI15')'; %Customer 69 monthly general consumption

N = length(load1_GC);

% calculate power flow and save result of each calculation to an individual
% file

i = 1;
while(i<N+1)
    define_constants;
    mpc = loadcase('captd_case_30.m');
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
    
    mpc.bus(22, PD) = load21_GC(1,i);
    mpc.bus(22, QD) = 0.3286*load21_GC(1,i);
    mpc.bus(23, PD) = load22_GC(1,i);
    mpc.bus(23, QD) = 0.3286*load22_GC(1,i);
    mpc.bus(24, PD) = load23_GC(1,i);
    mpc.bus(24, QD) = 0.3286*load23_GC(1,i);
    mpc.bus(25, PD) = load24_GC(1,i);
    mpc.bus(25, QD) = 0.3286*load24_GC(1,i);
    mpc.bus(26, PD) = load25_GC(1,i);
    mpc.bus(26, QD) = 0.3286*load25_GC(1,i);
    mpc.bus(27, PD) = load26_GC(1,i);
    mpc.bus(27, QD) = 0.3286*load26_GC(1,i);
    mpc.bus(28, PD) = load27_GC(1,i);
    mpc.bus(28, QD) = 0.3286*load27_GC(1,i);
    mpc.bus(29, PD) = load28_GC(1,i);
    mpc.bus(29, QD) = 0.3286*load28_GC(1,i);
    mpc.bus(30, PD) = load29_GC(1,i);
    mpc.bus(30, QD) = 0.3286*load29_GC(1,i);
    mpc.bus(31, PD) = load30_GC(1,i);
    mpc.bus(31, QD) = 0.3286*load30_GC(1,i);
    
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
