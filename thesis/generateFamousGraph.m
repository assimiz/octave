function links = generateFamousGraph(type, size)

graph_LINE = 0; graph_COMPLETE=1; graph_GRID=2;

if type == graph_LINE
	links = createLineGraph(size);
elseif type == graph_COMPLETE
	g = graph(size);
	complete(g);
	links = createBiGraph(edges(g));
elseif type == graph_GRID
	g = graph(size);
	grid(g, round(size^.5), round(size^.5));
	links = createBiGraph(edges(g));
end