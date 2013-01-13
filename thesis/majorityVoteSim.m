%runs the majority vote simulation for a specified links file name.
% links = Nx2 matrix where each row is a link and each row  
%	(source_id, dest_id) indicates an undirected link from source to dest.
% 	axismode = must be one of 'linear' or 'log'. determines if elite size
% will be sampled on linear or log scale.
%   numsteps = number of steps
%	elitepower = power for elite member
%   commonpower = power for common member
function result = majorityVoteSim(links, resultsfilename, axismode, numsteps, elitepower, commonpower, rounds, graphname)

fprintf('Fixing links...\n');
links = fixLinks(links);
fprintf('calculating graph measurements...\n');
num_nodes = numel(unique(links));
num_links = size(links, 1) / 2;
fprintf('Running the majority vote simulation...\n');
elite_size = [];
if strcmp(axismode, 'linear') == 1
	elite_size = [1:round(num_nodes / numsteps):num_nodes];
elseif strcmp(axismode, 'log') == 1
	elite_size = unique(round(num_nodes.^[0.01:1 / numsteps:1]));
else
	fprintf('ERROR: undefined axismode for simulation. Use either linear or log \n');
end
result = playVotingGame(links, elite_size, num_nodes, elitepower, commonpower, rounds);
fprintf('Writing results to file %s...\n', strcat(resultsfilename, '.txt'));
csvwrite ( strcat(resultsfilename, '.txt'), result);
title = sprintf('Majority vote with elite coalition\nElite power = %d, Common power = %d, %d Round(s)\n%s',  elitepower, commonpower, rounds, graphname);
processResults(result,  strcat(resultsfilename, '.png'), title, axismode, num_nodes, num_links);