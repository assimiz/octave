
clear all; close all; clc
graph_LINE = 0; graph_COMPLETE=1; graph_GRID=2;

size = 63731;

type_famous_graph = graph_LINE;

if type_famous_graph == graph_LINE
	size_famous_graph = size;
	graphname = 'Line (facebook like)';
	fprintf('Generating %s graph (V = %d, D = %d)...\n', graphname, size_famous_graph);
	links = generateFamousGraph(type_famous_graph, size_famous_graph);
elseif type_famous_graph == graph_COMPLETE
	size_famous_graph = size;
	graphname = 'Complete (facebook like)';
	fprintf('Generating %s graph (V = %d, D = %d)...\n', graphname, size_famous_graph);
	links = generateFamousGraph(type_famous_graph, size_famous_graph);
elseif type_famous_graph == graph_GRID
	size_famous_graph = size;
	graphname = 'Grid (facebook like)';
	fprintf('Generating %s graph (V = %d, D = %d)...\n', graphname, size_famous_graph);
	links = generateFamousGraph(type_famous_graph, size_famous_graph);
end

elitepower = [1 2 4 8 16 32 64 128 256 512 1024];
commonpower = 1;
axismode = 'x-log-y-linear';


for rounds = [1 2 4 8 16 32 64]
	resultsfilename = strcat(graphname,...
	'-elite-m^0.5-', axismode, '-' ,num2str(rounds), '-rounds', '', '-results');
	majorityVoteSim2(links, resultsfilename, axismode, elitepower, commonpower, rounds, graphname);
end


