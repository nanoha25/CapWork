clc
clear all
%Load data from table

input_file = 'cap_data.xlsx';  

load49_GC = xlsread(input_file,'Monthly data sample','B4:B15')'; %Customer 49 monthly general consumption 
load50_GC = xlsread(input_file,'Monthly data sample','C4:C15')'; %Customer 50 monthly general consumption
load51_GC = xlsread(input_file,'Monthly data sample','D4:D15')'; %Customer 51 monthly general consumption
load49_CL = xlsread(input_file,'Monthly data sample','B18:B29')'; %Customer 49 monthly controlled load
load50_CL = xlsread(input_file,'Monthly data sample','C18:C29')'; %Customer 50 monthly controlled load
load51_CL = xlsread(input_file,'Monthly data sample','D18:D29')'; %Customer 51 monthly controlled load
load49_GG = xlsread(input_file,'Monthly data sample','B32:B43')'; %Customer 49 monthly gross generation
load50_GG = xlsread(input_file,'Monthly data sample','C32:C43')'; %Customer 50 monthly gross generation
load51_GG = xlsread(input_file,'Monthly data sample','D32:D43')'; %Customer 51 monthly gross generation

N = length(load49_GC);

%calculate power flow and save result of each calculation to an individual
%file

i = 1;
while(i<N+1)
    define_constants;
    mpc = loadcase('captd_case.m');
    mpc.bus(2, PD) = load49_GC(1,i);
    mpc.bus(2, QD) = 0.3286*load49_GC(1,i);
    mpc.bus(3, PD) = load50_GC(1,i);
    mpc.bus(3, QD) = 0.3286*load50_GC(1,i);
    mpc.bus(4, PD) = load51_GC(1,i);
    mpc.bus(4, QD) = 0.3286*load51_GC(1,i);
    mpc.gen(2, PG) = load49_GG(1,i);
    mpc.gen(2, QG) = 0.1021*load49_GG(1,i);
    mpc.gen(3, PG) = load50_GG(1,i);
    mpc.gen(3, QG) = 0.1021*load50_GG(1,i);
    mpc.gen(4, PG) = load51_GG(1,i);
    mpc.gen(4, QG) = 0.1021*load51_GG(1,i);
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
