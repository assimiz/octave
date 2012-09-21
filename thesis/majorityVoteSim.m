%runs the majority vote simulation for a specified links file name.
% linksfile = links file where each row is a link and each row  
%	(source_id, dest_id) indicates an undirected link from source to dest.
% axismode = must be one of 'linear' or 'log'. determines if elite size
% will be sampled on linear or log scale.
function proc_result = majorityVoteSim(linksfile, axismode)

results_file = strcat(substr(strtok(linksfile, '.'), findstr (strtok(linksfile, '.'), '/')(end) + 1), '-', axismode, '-results.csv');

fprintf('Loading links file %s...\n', linksfile);
links = load(linksfile);
fprintf('Fixing links...\n');
links = fixLinks(links);
fprintf('getting the number of nodes in the graph...\n');
num_nodes = numel(unique(links));
fprintf('Running the majority vote simulation...\n');
elitesize = [];
if strcmp(axismode, 'linear') == 1
	elitesize = [1:round(num_nodes / 100 + 1):num_nodes];
elseif strcmp(axismode, 'log') == 1
	elitesize = unique(round(num_nodes.^[0.01:0.01:1]));
else
	fprintf('ERROR: undefined axismode for simulation. Use either linear or log \n');
end
result = playVotingGame(links, elitesize, num_nodes);
fprintf('Writing results to file %s...\n', results_file);
csvwrite (results_file, result);
proc_result = processResults(result, linksfile, axismode);