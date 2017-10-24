clc
clear all
%Load data from table

input_file = 'cap_data.xlsx';  

b_edit_switch = input('Enter 0 if you do not want to set branch data.\n');
if b_edit_switch ~= 0
prompt1 = 'Enter r: ';
prompt2 = 'Enter x: ';
prompt3 = 'Enter b: ';

r = input(prompt1); 
x = input(prompt2); 
b = input(prompt3);
end

option_switch = input('Enter 1 if you want to enable additional options.\n');

    
% Load profile for general consumption
load1_GC = xlsread(input_file,'Monthly 30 homes','B4:B15')'; %Customer 40 monthly general consumption 
load2_GC = xlsread(input_file,'Monthly 30 homes','C4:C15')'; %Customer 41 monthly general consumption
load3_GC = xlsread(input_file,'Monthly 30 homes','D4:D15')'; %Customer 42 monthly general consumption
load4_GC = xlsread(input_file,'Monthly 30 homes','E4:E15')'; %Customer 43 monthly general consumption
load5_GC = xlsread(input_file,'Monthly 30 homes','F4:F15')'; %Customer 44 monthly general consumption
load6_GC = xlsread(input_file,'Monthly 30 homes','G4:G15')'; %Customer 45 monthly general consumption
load7_GC = xlsread(input_file,'Monthly 30 homes','H4:H15')'; %Customer 46 monthly general consumption
load8_GC = xlsread(input_file,'Monthly 30 homes','I4:I15')'; %Customer 47 monthly general consumption
load9_GC = xlsread(input_file,'Monthly 30 homes','J4:J15')'; %Customer 48 monthly general consumption
load10_GC = xlsread(input_file,'Monthly 30 homes','K4:K15')'; %Customer 49 monthly general consumption

load11_GC = xlsread(input_file,'Monthly 30 homes','L4:L15')'; %Customer 70 monthly general consumption 
load12_GC = xlsread(input_file,'Monthly 30 homes','M4:M15')'; %Customer 71 monthly general consumption
load13_GC = xlsread(input_file,'Monthly 30 homes','N4:N15')'; %Customer 72 monthly general consumption
load14_GC = xlsread(input_file,'Monthly 30 homes','O4:O15')'; %Customer 73 monthly general consumption
load15_GC = xlsread(input_file,'Monthly 30 homes','P4:P15')'; %Customer 74 monthly general consumption
load16_GC = xlsread(input_file,'Monthly 30 homes','Q4:Q15')'; %Customer 75 monthly general consumption
load17_GC = xlsread(input_file,'Monthly 30 homes','R4:R15')'; %Customer 76 monthly general consumption
load18_GC = xlsread(input_file,'Monthly 30 homes','S4:S15')'; %Customer 77 monthly general consumption
load19_GC = xlsread(input_file,'Monthly 30 homes','T4:T15')'; %Customer 78 monthly general consumption
load20_GC = xlsread(input_file,'Monthly 30 homes','U4:U15')'; %Customer 79 monthly general consumption

load21_GC = xlsread(input_file,'Monthly 30 homes','V4:V15')'; %Customer 60 monthly general consumption 
load22_GC = xlsread(input_file,'Monthly 30 homes','W4:WA15')'; %Customer 61 monthly general consumption
load23_GC = xlsread(input_file,'Monthly 30 homes','X4:XB15')'; %Customer 62 monthly general consumption
load24_GC = xlsread(input_file,'Monthly 30 homes','Y4:YC15')'; %Customer 63 monthly general consumption
load25_GC = xlsread(input_file,'Monthly 30 homes','Z4:ZD15')'; %Customer 64 monthly general consumption
load26_GC = xlsread(input_file,'Monthly 30 homes','AA4:AA15')'; %Customer 65 monthly general consumption
load27_GC = xlsread(input_file,'Monthly 30 homes','AB4:AB15')'; %Customer 66 monthly general consumption
load28_GC = xlsread(input_file,'Monthly 30 homes','AC4:AC15')'; %Customer 67 monthly general consumption
load29_GC = xlsread(input_file,'Monthly 30 homes','AD4:AD15')'; %Customer 68 monthly general consumption
load30_GC = xlsread(input_file,'Monthly 30 homes','AE4:AE15')'; %Customer 69 monthly general consumption


% %Load profile for gross generation
load1_GG = xlsread(input_file,'Monthly 30 homes','B18:B29')'; %Customer 40 monthly gross generation
load2_GG = xlsread(input_file,'Monthly 30 homes','C18:C29')'; %Customer 41 monthly gross generation
load3_GG = xlsread(input_file,'Monthly 30 homes','D18:D29')'; %Customer 42 monthly gross generation
load4_GG = xlsread(input_file,'Monthly 30 homes','E18:E29')'; %Customer 43 monthly gross generation
load5_GG = xlsread(input_file,'Monthly 30 homes','F18:F29')'; %Customer 44 monthly gross generation
load6_GG = xlsread(input_file,'Monthly 30 homes','G18:G29')'; %Customer 45 monthly gross generation
load7_GG = xlsread(input_file,'Monthly 30 homes','H18:H29')'; %Customer 46 monthly gross generation
load8_GG = xlsread(input_file,'Monthly 30 homes','I18:I29')'; %Customer 47 monthly gross generation
load9_GG = xlsread(input_file,'Monthly 30 homes','J18:J29')'; %Customer 48 monthly gross generation
load10_GG = xlsread(input_file,'Monthly 30 homes','K18:K29')'; %Customer 49 monthly gross generation
% 
% load11_GG = xlsread(input_file,'Monthly 30 homes','L18:L29')'; %Customer 40 monthly gross generation
% load12_GG = xlsread(input_file,'Monthly 30 homes','M18:M29')'; %Customer 41 monthly gross generation
% load13_GG = xlsread(input_file,'Monthly 30 homes','N18:N29')'; %Customer 42 monthly gross generation
% load14_GG = xlsread(input_file,'Monthly 30 homes','O18:O29')'; %Customer 43 monthly gross generation
% load15_GG = xlsread(input_file,'Monthly 30 homes','P18:P29')'; %Customer 44 monthly gross generation
% load16_GG = xlsread(input_file,'Monthly 30 homes','Q18:Q29')'; %Customer 45 monthly gross generation
% load17_GG = xlsread(input_file,'Monthly 30 homes','R18:R29')'; %Customer 46 monthly gross generation
% load18_GG = xlsread(input_file,'Monthly 30 homes','S18:S29')'; %Customer 47 monthly gross generation
% load19_GG = xlsread(input_file,'Monthly 30 homes','T18:T29')'; %Customer 48 monthly gross generation
% load20_GG = xlsread(input_file,'Monthly 30 homes','U18:U29')'; %Customer 49 monthly gross generation
% % 
% load21_GG = xlsread(input_file,'Monthly 30 homes','V18:V29')'; %Customer 40 monthly gross generation
% load22_GG = xlsread(input_file,'Monthly 30 homes','W18:W29')'; %Customer 41 monthly gross generation
% load23_GG = xlsread(input_file,'Monthly 30 homes','X18:X29')'; %Customer 42 monthly gross generation
% load24_GG = xlsread(input_file,'Monthly 30 homes','Y18:Y29')'; %Customer 43 monthly gross generation
% load25_GG = xlsread(input_file,'Monthly 30 homes','Z18:Z29')'; %Customer 44 monthly gross generation
% load26_GG = xlsread(input_file,'Monthly 30 homes','AA18:AA29')'; %Customer 45 monthly gross generation
% load27_GG = xlsread(input_file,'Monthly 30 homes','AB18:AB29')'; %Customer 46 monthly gross generation
% load28_GG = xlsread(input_file,'Monthly 30 homes','AC18:AC29')'; %Customer 47 monthly gross generation
% load29_GG = xlsread(input_file,'Monthly 30 homes','AD18:AD29')'; %Customer 48 monthly gross generation
% load30_GG = xlsread(input_file,'Monthly 30 homes','AE18:AE29')'; %Customer 49 monthly gross generation

N = length(load1_GC);

% calculate power flow and save result of each calculation to an individual
% file

i = 1;
while(i<N+1)
    define_constants;
    mpc = loadcase('captd_30_base.m');
    %load/demand buses (General Consumption)
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
   
    
%     %generation buses (Gross Generation)
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
% 
%     mpc.gen(12, PG) = load11_GG(1,i);
%     mpc.gen(12, QG) = 0.1021*load11_GG(1,i);
%     mpc.gen(13, PG) = load12_GG(1,i);
%     mpc.gen(13, QG) = 0.1021*load12_GG(1,i);
%     mpc.gen(14, PG) = load13_GG(1,i);
%     mpc.gen(14, QG) = 0.1021*load13_GG(1,i);
%     mpc.gen(15, PG) = load14_GG(1,i);
%     mpc.gen(15, QG) = 0.1021*load14_GG(1,i);
%     mpc.gen(16, PG) = load15_GG(1,i);
%     mpc.gen(16, QG) = 0.1021*load15_GG(1,i);
%     mpc.gen(17, PG) = load16_GG(1,i);
%     mpc.gen(17, QG) = 0.1021*load16_GG(1,i);
%     mpc.gen(18, PG) = load17_GG(1,i);
%     mpc.gen(18, QG) = 0.1021*load17_GG(1,i);
%     mpc.gen(19, PG) = load18_GG(1,i);
%     mpc.gen(19, QG) = 0.1021*load18_GG(1,i);
%     mpc.gen(20, PG) = load19_GG(1,i);
%     mpc.gen(20, QG) = 0.1021*load19_GG(1,i);
%     mpc.gen(21, PG) = load20_GG(1,i);
%     mpc.gen(21, QG) = 0.1021*load20_GG(1,i);
%     
%     mpc.gen(22, PG) = load21_GG(1,i);
%     mpc.gen(22, QG) = 0.1021*load21_GG(1,i);
%     mpc.gen(23, PG) = load22_GG(1,i);
%     mpc.gen(23, QG) = 0.1021*load22_GG(1,i);
%     mpc.gen(24, PG) = load23_GG(1,i);
%     mpc.gen(24, QG) = 0.1021*load23_GG(1,i);
%     mpc.gen(25, PG) = load24_GG(1,i);
%     mpc.gen(25, QG) = 0.1021*load24_GG(1,i);
%     mpc.gen(26, PG) = load25_GG(1,i);
%     mpc.gen(26, QG) = 0.1021*load25_GG(1,i);
%     mpc.gen(27, PG) = load26_GG(1,i);
%     mpc.gen(27, QG) = 0.1021*load26_GG(1,i);
%     mpc.gen(28, PG) = load27_GG(1,i);
%     mpc.gen(28, QG) = 0.1021*load27_GG(1,i);
%     mpc.gen(29, PG) = load28_GG(1,i);
%     mpc.gen(29, QG) = 0.1021*load28_GG(1,i);
%     mpc.gen(30, PG) = load29_GG(1,i);
%     mpc.gen(30, QG) = 0.1021*load29_GG(1,i);
%     mpc.gen(31, PG) = load30_GG(1,i);
%     mpc.gen(31, QG) = 0.1021*load30_GG(1,i);

if b_edit_switch ~= 0
    
%branch resistance data
    mpc.branch(1, BR_R) = r;
    mpc.branch(2, BR_R) = r;
    mpc.branch(3, BR_R) = r;
    mpc.branch(4, BR_R) = r;
    mpc.branch(5, BR_R) = r;
    mpc.branch(6, BR_R) = r;
    mpc.branch(7, BR_R) = r;
    mpc.branch(8, BR_R) = r;
    mpc.branch(9, BR_R) = r;
    mpc.branch(10, BR_R) = r;
    mpc.branch(11, BR_R) = r;
    mpc.branch(12, BR_R) = r;
    mpc.branch(13, BR_R) = r;
    mpc.branch(14, BR_R) = r;
    mpc.branch(15, BR_R) = r;
    mpc.branch(16, BR_R) = r;
    mpc.branch(17, BR_R) = r;
    mpc.branch(18, BR_R) = r;
    mpc.branch(19, BR_R) = r;
    mpc.branch(20, BR_R) = r;
    mpc.branch(21, BR_R) = r;
    mpc.branch(22, BR_R) = r;
    mpc.branch(23, BR_R) = r;
    mpc.branch(24, BR_R) = r;
    mpc.branch(25, BR_R) = r;
    mpc.branch(26, BR_R) = r;
    mpc.branch(27, BR_R) = r;
    mpc.branch(16, BR_R) = r;
    mpc.branch(17, BR_R) = r;
    mpc.branch(18, BR_R) = r;
    mpc.branch(19, BR_R) = r;
    mpc.branch(20, BR_R) = r;
    mpc.branch(21, BR_R) = r;
    mpc.branch(22, BR_R) = r;
    mpc.branch(23, BR_R) = r;
    mpc.branch(24, BR_R) = r;
    mpc.branch(25, BR_R) = r;
    mpc.branch(26, BR_R) = r;
    mpc.branch(27, BR_R) = r;
    mpc.branch(28, BR_R) = r;
    mpc.branch(29, BR_R) = r;
    mpc.branch(30, BR_R) = r;
%     mpc.branch(31, BR_R) = r;
%     mpc.branch(32, BR_R) = r;
%     mpc.branch(33, BR_R) = r;
%     mpc.branch(34, BR_R) = r;
%     mpc.branch(35, BR_R) = r;
%     mpc.branch(36, BR_R) = r;
%     mpc.branch(37, BR_R) = r;
%     mpc.branch(38, BR_R) = r;
%     mpc.branch(39, BR_R) = r;
%     mpc.branch(40, BR_R) = r;
%     mpc.branch(41, BR_R) = r;
%     mpc.branch(42, BR_R) = r;
%     mpc.branch(43, BR_R) = r;
%     mpc.branch(44, BR_R) = r;
%     mpc.branch(45, BR_R) = r;
%     mpc.branch(46, BR_R) = r;
%     mpc.branch(47, BR_R) = r;
%     mpc.branch(48, BR_R) = r;
%     mpc.branch(49, BR_R) = r;
%     mpc.branch(50, BR_R) = r;
%     mpc.branch(51, BR_R) = r;
%     mpc.branch(52, BR_R) = r;
%     mpc.branch(53, BR_R) = r;
%     mpc.branch(54, BR_R) = r;
%     mpc.branch(55, BR_R) = r;
%     mpc.branch(56, BR_R) = r;
%     mpc.branch(57, BR_R) = r;
%     mpc.branch(58, BR_R) = r;
%     mpc.branch(59, BR_R) = r;

    
%branch reactance data    
    mpc.branch(1, BR_X) = x;
    mpc.branch(2, BR_X) = x;
    mpc.branch(3, BR_X) = x;
    mpc.branch(4, BR_X) = x;
    mpc.branch(5, BR_X) = x;
    mpc.branch(6, BR_X) = x;
    mpc.branch(7, BR_X) = x;
    mpc.branch(8, BR_X) = x;
    mpc.branch(9, BR_X) = x;
    mpc.branch(10, BR_X) = x;
    mpc.branch(11, BR_X) = x;
    mpc.branch(12, BR_X) = x;
    mpc.branch(13, BR_X) = x;
    mpc.branch(14, BR_X) = x;
    mpc.branch(15, BR_X) = x;
    mpc.branch(16, BR_X) = x;
    mpc.branch(17, BR_X) = x;
    mpc.branch(18, BR_X) = x;
    mpc.branch(19, BR_X) = x;
    mpc.branch(20, BR_X) = x;
    mpc.branch(21, BR_X) = x;
    mpc.branch(22, BR_X) = x;
    mpc.branch(23, BR_X) = x;
    mpc.branch(24, BR_X) = x;
    mpc.branch(25, BR_X) = x;
    mpc.branch(26, BR_X) = x;
    mpc.branch(27, BR_X) = x;
    mpc.branch(16, BR_X) = x;
    mpc.branch(17, BR_X) = x;
    mpc.branch(18, BR_X) = x;
    mpc.branch(19, BR_X) = x;
    mpc.branch(20, BR_X) = x;
    mpc.branch(21, BR_X) = x;
    mpc.branch(22, BR_X) = x;
    mpc.branch(23, BR_X) = x;
    mpc.branch(24, BR_X) = x;
    mpc.branch(25, BR_X) = x;
    mpc.branch(26, BR_X) = x;
    mpc.branch(27, BR_X) = x;
    mpc.branch(28, BR_X) = x;
    mpc.branch(29, BR_X) = x;
    mpc.branch(30, BR_X) = x;
%     mpc.branch(31, BR_X) = x;
%     mpc.branch(32, BR_X) = x;
%     mpc.branch(33, BR_X) = x;
%     mpc.branch(34, BR_X) = x;
%     mpc.branch(35, BR_X) = x;
%     mpc.branch(36, BR_X) = x;
%     mpc.branch(37, BR_X) = x;
%     mpc.branch(38, BR_X) = x;
%     mpc.branch(39, BR_X) = x;
%     mpc.branch(40, BR_X) = x;
%     mpc.branch(41, BR_X) = x;
%     mpc.branch(42, BR_X) = x;
%     mpc.branch(43, BR_X) = x;
%     mpc.branch(44, BR_X) = x;
%     mpc.branch(45, BR_X) = x;
%     mpc.branch(46, BR_X) = x;
%     mpc.branch(47, BR_X) = x;
%     mpc.branch(48, BR_X) = x;
%     mpc.branch(49, BR_X) = x;
%     mpc.branch(50, BR_X) = x;
%     mpc.branch(51, BR_X) = x;
%     mpc.branch(52, BR_X) = x;
%     mpc.branch(53, BR_X) = x;
%     mpc.branch(54, BR_X) = x;
%     mpc.branch(55, BR_X) = x;
%     mpc.branch(56, BR_X) = x;
%     mpc.branch(57, BR_X) = x;
%     mpc.branch(58, BR_X) = x;
%     mpc.branch(59, BR_X) = x;
    
%branch susceptace data    
    mpc.branch(1, BR_B) = b;
    mpc.branch(2, BR_B) = b;
    mpc.branch(3, BR_B) = b;
    mpc.branch(4, BR_B) = b;
    mpc.branch(5, BR_B) = b;
    mpc.branch(6, BR_B) = b;
    mpc.branch(7, BR_B) = b;
    mpc.branch(8, BR_B) = b;
    mpc.branch(9, BR_B) = b;
    mpc.branch(10, BR_B) = b;
    mpc.branch(11, BR_B) = b;
    mpc.branch(12, BR_B) = b;
    mpc.branch(13, BR_B) = b;
    mpc.branch(14, BR_B) = b;
    mpc.branch(15, BR_B) = b;
    mpc.branch(16, BR_B) = b;
    mpc.branch(17, BR_B) = b;
    mpc.branch(18, BR_B) = b;
    mpc.branch(19, BR_B) = b;
    mpc.branch(20, BR_B) = b;
    mpc.branch(21, BR_B) = b;
    mpc.branch(22, BR_B) = b;
    mpc.branch(23, BR_B) = b;
    mpc.branch(24, BR_B) = b;
    mpc.branch(25, BR_B) = b;
    mpc.branch(26, BR_B) = b;
    mpc.branch(27, BR_B) = b;
    mpc.branch(16, BR_B) = b;
    mpc.branch(17, BR_B) = b;
    mpc.branch(18, BR_B) = b;
    mpc.branch(19, BR_B) = b;
    mpc.branch(20, BR_B) = b;
    mpc.branch(21, BR_B) = b;
    mpc.branch(22, BR_B) = b;
    mpc.branch(23, BR_B) = b;
    mpc.branch(24, BR_B) = b;
    mpc.branch(25, BR_B) = b;
    mpc.branch(26, BR_B) = b;
    mpc.branch(27, BR_B) = b;
    mpc.branch(28, BR_B) = b;
    mpc.branch(29, BR_B) = b;
    mpc.branch(30, BR_B) = b;
%     mpc.branch(31, BR_B) = b;
%     mpc.branch(32, BR_B) = b;
%     mpc.branch(33, BR_B) = b;
%     mpc.branch(34, BR_B) = b;
%     mpc.branch(35, BR_B) = b;
%     mpc.branch(36, BR_B) = b;
%     mpc.branch(37, BR_B) = b;
%     mpc.branch(38, BR_B) = b;
%     mpc.branch(39, BR_B) = b;
%     mpc.branch(40, BR_B) = b;
%     mpc.branch(41, BR_B) = b;
%     mpc.branch(42, BR_B) = b;
%     mpc.branch(43, BR_B) = b;
%     mpc.branch(44, BR_B) = b;
%     mpc.branch(45, BR_B) = b;
%     mpc.branch(46, BR_B) = b;
%     mpc.branch(47, BR_B) = b;
%     mpc.branch(48, BR_B) = b;
%     mpc.branch(49, BR_B) = b;
%     mpc.branch(50, BR_B) = b;
%     mpc.branch(51, BR_B) = b;
%     mpc.branch(52, BR_B) = b;
%     mpc.branch(53, BR_B) = b;
%     mpc.branch(54, BR_B) = b;
%     mpc.branch(55, BR_B) = b;
%     mpc.branch(56, BR_B) = b;
%     mpc.branch(57, BR_B) = b;
%     mpc.branch(58, BR_B) = b;
%     mpc.branch(59, BR_B) = b;
    
end
    
    D = ['This is case ',num2str(i)];
    disp(D); %some output fine-tune
    if option_switch == 1
        mpopt = mpoption('pf.enforce_q_lims',2);
        %mpopt = mpoption('pf.alg','FDXB','pf.fd.max_it',100);
        %mpopt = mpoption('pf.alg','GS','pf.gs.max_it',2000);
        result = runpf(mpc,mpopt);
    else
        result = runpf(mpc);
    end
    sps = ['End of case ',num2str(i)]; %some output fine-tune
    disp(sps); 
    disp('-----------------------');
    filename = ['Cus_mo_' num2str(i) '.mat'];
    save(filename,'result');
    i = i + 1;
end
