%running the voting game simulation. Game goes like this:
%let |V| be the number of nodes in the graph
%let the elite be a set of the most important nodes in the graph
%for elite size of 1 to |V|
%we initialize voters of the elite with +1 (like)
%we initialize other voters with -1 (dislike) 
%	for all links
%		if the link's source nodes belongs to the elite --> do nothing
%		else if the dest node belongs to the elite --> add +1 to the vote of the source node
%		else  --> add -1 to the vote of the source node
%	end
%	the final vote of each node is sign(vote).
%save counters
%end
%
%	links = links matrix where each row is a link and each row  
%	(source_id, dest_id) indicates an undirected link from source to dest.
%	
%	game_result = array where each cell is a mapping between the size of
%	the elite to the total number of +1 voters at the end of the game.
%
function result_map = playVotingGame(links)

DEBUG = 1;

%getting the number of nodes in the graph
num_nodes = numel(unique(links));
step = round(num_nodes / 100 + 1);
i = 1;
for elite_size = 1:step:num_nodes
	if DEBUG
		fprintf('playVotingGame %d/%d\n', elite_size, num_nodes);
	end
	
	orig_votes = zeros(num_nodes, 1);	
	%we initialize voters of the elite with +1 (like)
	orig_votes(1:elite_size) = 1;
	%we initialize other voters with -1 (dislike)
	orig_votes(elite_size + 1:num_nodes) = -1;
	final_votes = orig_votes;	
	
	links_from_non_elite_nodes = links(find(links(:, 1) > elite_size), :);		
	%We can eliminate at least part of this for by using histograms on the number
	%of of time a particular non-elite src node appears and histogram on the number
	%of times it points to +1,0 and -1 voter.
	for l = 1:size(links_from_non_elite_nodes, 1)
		src_non_elite_node = links_from_non_elite_nodes(l,1);
		dst_node = links_from_non_elite_nodes(l,2);
		final_votes(src_non_elite_node) = final_votes(src_non_elite_node) + orig_votes(dst_node);
	end	
	
	result_map(i, 1) = elite_size;
	result_map(i, 2) = size(final_votes(find(final_votes < 0)), 1);
	result_map(i, 3) = size(final_votes(find(final_votes == 0)), 1);
	result_map(i, 4) = size(final_votes(find(final_votes > 0)), 1);
	
	i = i + 1;
end
