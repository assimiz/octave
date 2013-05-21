% clear all;
close all;
clc

models = {'erdos', 'barabasi'};

for i = 1:numel(models)
    %1. Load time file
    time = load('C:/Users/mizrachi/Documents/GitHub/octave/thesis/time/cit-HepPh_time_final.txt');
    %2. Load links file
    links = load('C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-Cit-HepPh.txt');
    years = (1992:2002);
    nodes = [];
    model = models{i};
    %3. Filter nodes from time file per up to some date (make sure we have at
    %   least 10 time samples)
    for year = years
        %4. Filter links - only links where both source and sink nodes pass the filter
        %   should be included
        cur_nodes = time(time(:, 2) == year, 1);
        nodes = unique([nodes; cur_nodes]);
        fprintf('Running majority vote for %d (N=%d) %s...\n', year, month, size(nodes, 1), model);
        resultsfilprefix = sprintf('Brightkite-%d-%d_N=%d_%s', year, month, size(nodes, 1), model);
        links_of_src_nodes = ismember(links(:, 1), nodes);
        links_of_dst_nodes = ismember(links(:, 2), nodes);
        cur_links = links(links_of_src_nodes & links_of_dst_nodes, :);
        %take graph measurements
        [n, m, d, e] = graphMeasurements(cur_links);
        num_nodes = n;
        avg_degree = m / n;
        if n > 0 && m > 0
            %create matching graph
            fname = 'graph_asymptotic_temp.txt';
            if (strcmp(model,'erdos'))
                generateErdosRenyiGraphSNAP(num_nodes, avg_degree, fname);
            elseif (strcmp(model,'barabasi'))
                generateBarabasiAlbertGraphSNAP(num_nodes, avg_degree, fname);
            else
                error('type must erdos or barabasi');
            end
            temp_links = loadSnapLinksFile(fname);
            bilinks = createBiGraph(temp_links);
            %5. For the matching graph - run binary search majority vote
            majorityVoteBinarySearch(bilinks, resultsfilprefix);
        end
    end
end


