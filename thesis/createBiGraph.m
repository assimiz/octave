function bilinks = createBiGraph(links)
bilinks = [links; [links(:, 2), links(:, 1)]];
bilinks = unique(bilinks, 'rows');
bilinks = sortrows(bilinks, [1 2]);