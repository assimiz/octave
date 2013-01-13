function links = createLineGraph(n)

links = zeros(n - 1, 2);
k = 1;
for i = 1 : n - 1
	links(i, :) = [i i+1];
end
links = createBiGraph(links);