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
%	elitepower = vote for elite member
%   commonpower = vote for common member
%   rounds = number of rounds
%   elitemode = 'monopoloy' or 'none'. monopoly means the elite does not play 'fair' - 
%  it is not changing its vote regardless of the majority. 
%   
%	
%	result_map = matrix of the following format: 
% 	result_map(:, 1) = elite_size;	
%	result_map(:, 2) = dislike_voters;
%	result_map(:, 3) = neutral_voters;
%	result_map(:, 4) = like_voters;
%
function result_map = playVotingGame(links, elitesize, numnodes, elitepower, commonpower, rounds, elitemode)

DEBUG = 1;

if nargin < 7, elitemode = 'monopoloy'; end

k = 0;
result_map = zeros(numel(elitesize), 4);
fprintf('playVotingGame: ');
for i = 1:numel(elitesize)
	elite = elitesize(i);
	orig_votes = zeros(numnodes, 1);	
	%we initialize voters of the elite
	orig_votes(1:elite) = 1;
	%we initialize other voters
	orig_votes(elite + 1:numnodes) = -1;
	final_votes = orig_votes;	
	for j = 1: rounds		
		k = k + 1;
		if DEBUG
			fprintf('%d%% ', round(k / (numel(elitesize) * rounds) * 100));
		end
		
		if strcmp(elitemode,'monopoly') == 1
			links_to_update = links(links(:, 1) > elite, :);					
		else
			links_to_update = links;					
		end
		%We can eliminate at least part of this for loop by using histograms on the number
		%of of time a particular non-elite src node appears and histogram on the number
		%of times it points to +1, 0 and -1 voter.
		for l = 1:size(links_to_update, 1)
			src_node = links_to_update(l,1);
			dst_node = links_to_update(l,2);
			if dst_node <= elite
				power = elitepower;
			else
				power = commonpower;
			end
			final_votes(src_node) = final_votes(src_node) + orig_votes(dst_node) * power;
		end	
		
		dislike_voters = find(final_votes < 0);
		neutral_voters = find(final_votes == 0);
		like_voters = find(final_votes > 0);
		
		num_dislike_voters = size(dislike_voters, 1);
		num_neutral_voters = size(neutral_voters, 1);
		num_like_voters = size(like_voters, 1);
		total = num_dislike_voters + num_neutral_voters + num_like_voters;
		
		result_map(i, 1) = elite;	
		result_map(i, 2) = num_dislike_voters;
		result_map(i, 3) = num_neutral_voters;
		result_map(i, 4) = num_like_voters;
		
		final_votes(dislike_voters) = -1;
		final_votes(neutral_voters) = 0;
		final_votes(like_voters) = 1;
		orig_votes = final_votes;
	end

end
fprintf('\n');	
