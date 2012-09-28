%runs the majority vote simulation for a specified links file name.
% linksfile = links file where each row is a link and each row  
%	(source_id, dest_id) indicates an undirected link from source to dest.
% 	axismode = must be one of 'linear' or 'log'. determines if elite size
% will be sampled on linear or log scale.
%   numsteps = number of steps
%	elitevote = vote for elite member
%   commonvote = vote for common member
function result = majorityVoteSim(linksfile, axismode, numsteps, elitevote, commonvote = -1)

results_file = strcat(substr(strtok(linksfile, '.'), findstr (strtok(linksfile, '.'), '/')(end) + 1),...
	'-elite-', num2str(elitevote), '-common', num2str(commonvote), '-', axismode, '-results.csv');

fprintf('Loading links file %s...\n', linksfile);
links = load(linksfile);
fprintf('Fixing links...\n');
links = fixLinks(links);
fprintf('getting the number of nodes in the graph...\n');
num_nodes = numel(unique(links));
fprintf('Running the majority vote simulation...\n');
elite_size = [];
if strcmp(axismode, 'linear') == 1
	elite_size = [1:round(num_nodes / numsteps):num_nodes];
elseif strcmp(axismode, 'log') == 1
	elite_size = unique(round(num_nodes.^[0.01:1 / numsteps:1]));
else
	fprintf('ERROR: undefined axismode for simulation. Use either linear or log \n');
end
result = playVotingGame(links, elite_size, num_nodes, elitevote, commonvote);
fprintf('Writing results to file %s...\n', results_file);
csvwrite (results_file, result);
title = strcat(substr(strtok(linksfile, '.'), findstr (strtok(linksfile, '.'), '/')(end) + 1),...
	', elite vote = ', num2str(elitevote), ', common vote = ', num2str(commonvote));
processResults(result, title, axismode);