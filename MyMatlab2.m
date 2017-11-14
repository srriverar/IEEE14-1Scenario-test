%% MyMatlab2
% This script creates the 'solution2.txt' file
%addpath('dependencies')
global pfotemp
scenarioDir = pfotemp;
rawFile = fullfile(scenarioDir, 'powersystem.raw');
genFile = fullfile(scenarioDir, 'generator.csv');
contingFile = fullfile(scenarioDir, 'contingency.csv');
mpc = convert2mpc(rawFile,genFile);
contingencies = loadContingencies(mpc,contingFile);
[result, success] = solve_opf(mpc, contingencies,1);
create_solution2(result, contingencies,1);