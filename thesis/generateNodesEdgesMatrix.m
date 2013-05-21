clear all;
close all;
clc

%1. Load time file
time = load('C:/Users/mizrachi/Documents/GitHub/octave/thesis/time/brightkite_time_final.txt');
%2. Load links file
links = load('C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-Brightkite_edges.txt');
years = [2008 2009];
months = (1:12);
nodes = [];
%3. Filter nodes from time file per up to some date (make sure we have at
%   least 10 time samples)
map = zeros(0, 2);
for year = years
    for month = months
        %4. Filter links - only links where both source and sink nodes pass the filter
        %   should be included
        cur_nodes = time(time(:, 2) == year & time(:, 3) == month, 1);
        nodes = unique([nodes; cur_nodes]);
        links_of_src_nodes = ismember(links(:, 1), nodes);
        links_of_dst_nodes = ismember(links(:, 2), nodes);
        cur_links = links(links_of_src_nodes & links_of_dst_nodes, :);
        map = [map ; [numel(nodes) size(cur_links, 1)]];
    end
end
dlmwrite('brightkite_nodes_edges_map.txt', map, 'delimiter', ',', 'precision', '%i');


%1. Load time file
time = load('C:/Users/mizrachi/Documents/GitHub/octave/thesis/time/gowalla_time_final.txt');
%2. Load links file
links = load('C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-Gowalla_edges.txt');
years = [2009 2010];
months = (1:12);
nodes = [];
%3. Filter nodes from time file per up to some date (make sure we have at
%   least 10 time samples)
map = zeros(0, 2);
for year = years
    for month = months
        %4. Filter links - only links where both source and sink nodes pass the filter
        %   should be included
        cur_nodes = time(time(:, 2) == year & time(:, 3) == month, 1);
        nodes = unique([nodes; cur_nodes]);
        links_of_src_nodes = ismember(links(:, 1), nodes);
        links_of_dst_nodes = ismember(links(:, 2), nodes);
        cur_links = links(links_of_src_nodes & links_of_dst_nodes, :);
        map = [map ; [numel(nodes) size(cur_links, 1)]];
    end
end
dlmwrite('gowalla_nodes_edges_map.txt', map, 'delimiter', ',', 'precision', '%i');

%1. Load time file
time = load('C:/Users/mizrachi/Documents/GitHub/octave/thesis/time/cit-HepPh_time_final.txt');
%2. Load links file
links = load('C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-Cit-HepPh.txt');
years = (1992:2002);
nodes = [];
%3. Filter nodes from time file per up to some date (make sure we have at
%   least 10 time samples)
map = zeros(0, 2);
for year = years
    %4. Filter links - only links where both source and sink nodes pass the filter
    %   should be included
    cur_nodes = time(time(:, 2) == year, 1);
    nodes = unique([nodes; cur_nodes]);
    links_of_src_nodes = ismember(links(:, 1), nodes);
    links_of_dst_nodes = ismember(links(:, 2), nodes);
    cur_links = links(links_of_src_nodes & links_of_dst_nodes, :);
    map = [map ; [numel(nodes) size(cur_links, 1)]];    
end
dlmwrite('cit-hepph_nodes_edges_map.txt', map, 'delimiter', ',', 'precision', '%i');


