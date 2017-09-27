clc
clear all
%Load data from table

input_file = 'cap_data.xlsx';  

load140_GC = xlsread(input_file,'Monthly 10 homes','B4:B15')'; %Customer 140 monthly general consumption 
load141_GC = xlsread(input_file,'Monthly 10 homes','C4:C15')'; %Customer 141 monthly general consumption
load142_GC = xlsread(input_file,'Monthly 10 homes','D4:D15')'; %Customer 142 monthly general consumption
load143_GC = xlsread(input_file,'Monthly 10 homes','E4:E15')'; %Customer 143 monthly general consumption
load144_GC = xlsread(input_file,'Monthly 10 homes','F4:F15')'; %Customer 144 monthly general consumption
load145_GC = xlsread(input_file,'Monthly 10 homes','G4:G15')'; %Customer 145 monthly general consumption
load146_GC = xlsread(input_file,'Monthly 10 homes','H4:H15')'; %Customer 146 monthly general consumption
load147_GC = xlsread(input_file,'Monthly 10 homes','I4:I15')'; %Customer 147 monthly general consumption
load148_GC = xlsread(input_file,'Monthly 10 homes','J4:J15')'; %Customer 148 monthly general consumption
load149_GC = xlsread(input_file,'Monthly 10 homes','K4:K15')'; %Customer 149 monthly general consumption

load140_GG = xlsread(input_file,'Monthly 10 homes','B18:B29')'; %Customer 140 monthly gross generation
load141_GG = xlsread(input_file,'Monthly 10 homes','C18:C29')'; %Customer 141 monthly gross generation
load142_GG = xlsread(input_file,'Monthly 10 homes','D18:D29')'; %Customer 142 monthly gross generation
load143_GG = xlsread(input_file,'Monthly 10 homes','E18:E29')'; %Customer 143 monthly gross generation
load144_GG = xlsread(input_file,'Monthly 10 homes','F18:F29')'; %Customer 144 monthly gross generation
load145_GG = xlsread(input_file,'Monthly 10 homes','G18:G29')'; %Customer 145 monthly gross generation
load146_GG = xlsread(input_file,'Monthly 10 homes','H18:H29')'; %Customer 146 monthly gross generation
load147_GG = xlsread(input_file,'Monthly 10 homes','I18:I29')'; %Customer 147 monthly gross generation
load148_GG = xlsread(input_file,'Monthly 10 homes','J18:J29')'; %Customer 148 monthly gross generation
load149_GG = xlsread(input_file,'Monthly 10 homes','K18:K29')'; %Customer 149 monthly gross generation


N = length(load140_GC);

% calculate power flow and save result of each calculation to an individual
% file

i = 1;
while(i<N+1)
    define_constants;
    mpc = loadcase('captd_case.m');
    mpc.bus(2, PD) = load140_GC(1,i);
    mpc.bus(2, QD) = 0.3286*load140_GC(1,i);
    mpc.bus(3, PD) = load141_GC(1,i);
    mpc.bus(3, QD) = 0.3286*load141_GC(1,i);
    mpc.bus(4, PD) = load142_GC(1,i);
    mpc.bus(4, QD) = 0.3286*load142_GC(1,i);
    mpc.bus(5, PD) = load143_GC(1,i);
    mpc.bus(5, QD) = 0.3286*load143_GC(1,i);
    mpc.bus(6, PD) = load144_GC(1,i);
    mpc.bus(6, QD) = 0.3286*load144_GC(1,i);
    mpc.bus(7, PD) = load145_GC(1,i);
    mpc.bus(7, QD) = 0.3286*load145_GC(1,i);
    mpc.bus(8, PD) = load146_GC(1,i);
    mpc.bus(8, QD) = 0.3286*load146_GC(1,i);
    mpc.bus(9, PD) = load147_GC(1,i);
    mpc.bus(9, QD) = 0.3286*load147_GC(1,i);
    mpc.bus(10, PD) = load148_GC(1,i);
    mpc.bus(10, QD) = 0.3286*load148_GC(1,i);
    mpc.bus(11, PD) = load149_GC(1,i);
    mpc.bus(11, QD) = 0.3286*load149_GC(1,i);
%---------------------------------------------
    mpc.gen(2, PG) = load140_GG(1,i);
    mpc.gen(2, QG) = 0.1021*load140_GG(1,i);
    mpc.gen(3, PG) = load141_GG(1,i);
    mpc.gen(3, QG) = 0.1021*load141_GG(1,i);
    mpc.gen(4, PG) = load142_GG(1,i);
    mpc.gen(4, QG) = 0.1021*load142_GG(1,i);
    mpc.gen(5, PG) = load143_GG(1,i);
    mpc.gen(5, QG) = 0.1021*load143_GG(1,i);
    mpc.gen(6, PG) = load144_GG(1,i);
    mpc.gen(6, QG) = 0.1021*load144_GG(1,i);
    mpc.gen(7, PG) = load145_GG(1,i);
    mpc.gen(7, QG) = 0.1021*load145_GG(1,i);
    mpc.gen(8, PG) = load146_GG(1,i);
    mpc.gen(8, QG) = 0.1021*load146_GG(1,i);
    mpc.gen(9, PG) = load147_GG(1,i);
    mpc.gen(9, QG) = 0.1021*load147_GG(1,i);
    mpc.gen(10, PG) = load148_GG(1,i);
    mpc.gen(10, QG) = 0.1021*load148_GG(1,i);
    mpc.gen(11, PG) = load149_GG(1,i);
    mpc.gen(11, QG) = 0.1021*load149_GG(1,i);
%---------------------------------------------
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