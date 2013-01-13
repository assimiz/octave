
clear all; close all; clc

links = createCompleteGraph(100);
links = createBiGraph(links);
graphname = 'Mesh (size=100)';
elitepower = [1 2 4 8];
commonpower = 1;
axismode = 'x-log-y-linear';
result = [];

for rounds = [1 2 4 8]
	resultsfilename = strcat(graphname,...
	'-elite-m^0.5-', axismode, '-' ,num2str(rounds), '-rounds', '', '-results');
	result = [result; majorityVoteSim2(links, resultsfilename, axismode, elitepower, commonpower, rounds, graphname)];
end

