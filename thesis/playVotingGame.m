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
%	elitesize = array containting all elite sizes
%	numnodes = number of unique nodes in links
%	
%	result_map = matrix of the following format: 
% 	result_map(:, 1) = elite_size;	
%	result_map(:, 2) = dislike_voters;
%	result_map(:, 3) = neutral_voters;
%	result_map(:, 4) = like_voters;
%
function result_map = playVotingGame(links, elitesize, numnodes)

DEBUG = 1;

for i = 1:numel(elitesize)
	if DEBUG
		fprintf('playVotingGame %d%%\n', i / numel(elitesize) * 100);
	end
	
	elite = elitesize(i);
	orig_votes = zeros(numnodes, 1);	
	%we initialize voters of the elite with +1 (like)
	orig_votes(1:elite) = 1;
	%we initialize other voters with -1 (dislike)
	orig_votes(elite + 1:numnodes) = -1;
	final_votes = orig_votes;	
	
	links_from_non_elite_nodes = links(find(links(:, 1) > elite), :);		
	%We can eliminate at least part of this for loop by using histograms on the number
	%of of time a particular non-elite src node appears and histogram on the number
	%of times it points to +1, 0 and -1 voter.
	for l = 1:size(links_from_non_elite_nodes, 1)
		src_non_elite_node = links_from_non_elite_nodes(l,1);
		dst_node = links_from_non_elite_nodes(l,2);
		final_votes(src_non_elite_node) = final_votes(src_non_elite_node) + orig_votes(dst_node);
	end	
	
	dislike_voters = size(final_votes(find(final_votes < 0)), 1);
	neutral_voters = size(final_votes(find(final_votes == 0)), 1);
	like_voters = size(final_votes(find(final_votes > 0)), 1);
	total = dislike_voters + neutral_voters + like_voters;
	
	result_map(i, 1) = elite;	
	result_map(i, 2) = dislike_voters;
	result_map(i, 3) = neutral_voters;
	result_map(i, 4) = like_voters;

end
