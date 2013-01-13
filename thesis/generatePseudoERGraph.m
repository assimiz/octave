%generates pseudo ER graph. In order to deal with very large
%size we are willing to accept duplicate edges taking in account
%this will not occure for small link probability.
function links = generatePseudoERGraph(N, numUniEdges)

links = zeros(numUniEdges, 2);
for i = 1:numUniEdges
	%eliminate self edges
	%this is just for the first condtion to pass
	u = 1; v = 1;
	while u == v
		u = round(rand * N) + 1;
		v = round(rand * N) + 1;
	end	
	links(i, :) = [u v];
end

links = unique(links, 'rows');
links = createBiGraph(links);
