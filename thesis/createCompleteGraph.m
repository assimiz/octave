function links = createCompleteGraph(n)

links = zeros(n * (n-1) / 2, 2);
k = 1;
for i = 1 : n
	for j = i + 1 : n
		links(k, :) = [i, j]; 	
		k = k + 1;
	end
end
links = createBiGraph(links);