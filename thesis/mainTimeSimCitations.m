% clear all;
close all;
clc
%1. Load time file
time = load('C:/Users/mizrachi/Documents/GitHub/octave/thesis/time/cit-HepPh_time_final.txt');
%2. Load links file
links = load('C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-Cit-HepPh.txt');
years = (1992:2002);
nodes = [];
%3. Filter nodes from time file per up to some date (make sure we have at
%   least 10 time samples)
for year = years
    %4. Filter links - only links where both source and sink nodes pass the filter
    %   should be included
    cur_nodes = time(time(:, 2) == year, 1);
    nodes = unique([nodes; cur_nodes]);
    fprintf('Running majority vote for %d (N=%d)...\n', year, size(nodes, 1));
    resultsfilprefix = sprintf('Cit-hepPh-%d_N=%d...\n', year, size(nodes, 1));
    links_of_src_nodes = ismember(links(:, 1), nodes);
    links_of_dst_nodes = ismember(links(:, 2), nodes);
    cur_links = links(links_of_src_nodes & links_of_dst_nodes, :);
    
    majorityVoteBinarySearchElitePower(cur_links, resultsfilprefix);
    %     end
end



%6. For the filtered links - run binary search majority vote for samples of
%7. elite power (1 2 4,...8192).
