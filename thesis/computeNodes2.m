%computes nodes matrix out of specified links matrix.
% links = links matrix where each row is a link and each row  
%	(source_id, dest_id) indicates an undirected link from source to dest.
% nodes = matrix of the following format: 
%   nodes(i, :) = map between old node id to new node data
% 	nodes(:, 1) = new node id (according to incoming rank);	
%	nodes(:, 2) = outgoing rank;
%	nodes(:, 3) = incoming rank;
function nodes = computeNodes2(links)
fprintf('Getting unique IDs...\n');
nodes = unique(links);
out_rank = histc(links(:, 1), nodes);
in_rank = histc(links(:, 2), nodes);
fprintf('Building nodes matrix...\n');
nodes = [nodes out_rank in_rank];
fprintf('Sorting nodes according to in-rank...\n');
%Sorting nodes according to in-rank
nodes = sortrows(nodes, -3);
fprintf('adding new id column in ascending order from the most important node to the least...\n');
%adding new id column in ascending order from the most important
%node to the least.
nodes = [(1:size(nodes, 1))' nodes];
fprintf('restoring original sorting (by old_id)...\n');
%restoring original sorting (by old_id)
nodes = sortrows(nodes, 2);
fprintf('removing redundant old_id_column...\n');
%removing redundant old_id_column
nodes = [nodes(:, 1) nodes(:, 3) nodes(:, 4)];