%% MyMatlab1
% This script solves the problem and creates the 'solution1.txt' file
%addpath('dependencies')
global pfotemp
scenarioDir = pfotemp;
rawFile = fullfile(scenarioDir, 'powersystem.raw');
genFile = fullfile(scenarioDir, 'generator.csv');
contingFile = fullfile(scenarioDir, 'contingency.csv');
mpc = convert2mpc(rawFile,genFile);
contingencies = loadContingencies(mpc,contingFile);
[result, success] = solve_opf(mpc, contingencies,1);