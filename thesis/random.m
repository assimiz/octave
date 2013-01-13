
clear all; close all; clc
graph_ER = 0; graph_LATTICE=1; graph_BA=2; graph_SO=3; graph_WS=4; graph_DEGSEQ=5; graph_REGULAR=6;

size_random_graph = 63731;
degree = 3;
uni_degree = round(degree / 2);
link_probability = degree / size_random_graph;
num_uni_edges = round(degree / 2 * size_random_graph);

type_random_graph = graph_BA;

if type_random_graph == graph_BA
	graphname = 'Barabasi-Albert (facebook like)';
	fprintf('Generating %s graph (V = %d, D = %d)...\n', graphname, size_random_graph, uni_degree);
	sparse_matrix = generate_random_graph(type_random_graph, size_random_graph, uni_degree);
	[i, j, s] = find(sparse_matrix);
	links = [i j];
elseif type_random_graph == graph_ER
	graphname = 'Erdos-Renyi (facebook like)';
	fprintf('Generating %s graph (V = %d, Num Edges = %d)...\n', graphname, size_random_graph, num_uni_edges);
	links = generatePseudoERGraph(size_random_graph, num_uni_edges);
end

elitepower = [1 2 4 8 16 32 64 128 256 512 1024 2048];
commonpower = 1;
axismode = 'x-log-y-linear';







for rounds = [1 2 4 8 16 32 64 128]
	resultsfilename = strcat(graphname,...
	'-elite-m^0.5-', axismode, '-' ,num2str(rounds), '-rounds', 'no-monopoly', '-results');
	majorityVoteSim2(links, resultsfilename, axismode, elitepower, commonpower, rounds, graphname);
end
