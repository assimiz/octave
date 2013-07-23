clear all;
close all;
clc

%1. Load time file
time = load('C:/Users/mizrachi/Documents/GitHub/octave/thesis/time/out.slashdot-threads_time_final.txt');
%2. Load links file
links = load('C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-out.slashdot-threads-links.txt');
years = (2005:2006);
months = (1:12);
nodes = [];
%3. Filter nodes from time file per up to some date (make sure we have at
%   least 10 time samples)
map = zeros(0, 2);
for year = years
    for month = months
        %4. Filter links - only links where both source and sink nodes pass the filter
        %   should be included
        nodes = time(time(:, 2) < year | (time(:, 2) == year & time(:, 3) <= month), 1);
        links_of_src_nodes = ismember(links(:, 1), nodes);
        links_of_dst_nodes = ismember(links(:, 2), nodes);
        cur_links = links(links_of_src_nodes & links_of_dst_nodes, :);
        map = [map ; [numel(nodes) size(cur_links, 1)]];
    end
end
dlmwrite('slashdot_nodes_edges_map.txt', map, 'delimiter', ',', 'precision', '%i');

%1. Load time file
time = load('C:/Users/mizrachi/Documents/GitHub/octave/thesis/time/out.enron_time_final.txt');
%2. Load links file
links = load('C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-out.enron-links.txt');
years = (1998:2004);
months = [1 5 9];
nodes = [];
%3. Filter nodes from time file per up to some date (make sure we have at
%   least 10 time samples)
map = zeros(0, 2);
for year = years
    for month = months
        %4. Filter links - only links where both source and sink nodes pass the filter
        %   should be included
        nodes = time(time(:, 2) < year | (time(:, 2) == year & time(:, 3) <= month), 1);
        links_of_src_nodes = ismember(links(:, 1), nodes);
        links_of_dst_nodes = ismember(links(:, 2), nodes);
        cur_links = links(links_of_src_nodes & links_of_dst_nodes, :);
        map = [map ; [numel(nodes) size(cur_links, 1)]];
    end
end
dlmwrite('enron_nodes_edges_map.txt', map, 'delimiter', ',', 'precision', '%i');

%1. Load time file
time = load('C:/Users/mizrachi/Documents/GitHub/octave/thesis/time/out.epinions_time_final.txt');
%2. Load links file
links = load('C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-out.epinions-links.txt');
years = (2001:2003);
months = [1 3 5 7 9 11];
nodes = [];
%3. Filter nodes from time file per up to some date (make sure we have at
%   least 10 time samples)
map = zeros(0, 2);
for year = years
    for month = months
        %4. Filter links - only links where both source and sink nodes pass the filter
        %   should be included
        nodes = time(time(:, 2) < year | (time(:, 2) == year & time(:, 3) <= month), 1);
        links_of_src_nodes = ismember(links(:, 1), nodes);
        links_of_dst_nodes = ismember(links(:, 2), nodes);
        cur_links = links(links_of_src_nodes & links_of_dst_nodes, :);
        map = [map ; [numel(nodes) size(cur_links, 1)]];
    end
end
dlmwrite('epinions_nodes_edges_map.txt', map, 'delimiter', ',', 'precision', '%i');

%1. Load time file
time = load('C:/Users/mizrachi/Documents/GitHub/octave/thesis/time/out.facebook-wosn-links_time_final.txt');
%2. Load links file
links = load('C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-out.facebook-wosn-links.txt');
years = (2006:2009);
months = [1 3 5 7 9 11];
nodes = [];
%3. Filter nodes from time file per up to some date (make sure we have at
%   least 10 time samples)
map = zeros(0, 2);
for year = years
    for month = months
        %4. Filter links - only links where both source and sink nodes pass the filter
        %   should be included
        nodes = time(time(:, 2) < year | (time(:, 2) == year & time(:, 3) <= month), 1);
        links_of_src_nodes = ismember(links(:, 1), nodes);
        links_of_dst_nodes = ismember(links(:, 2), nodes);
        cur_links = links(links_of_src_nodes & links_of_dst_nodes, :);
        map = [map ; [numel(nodes) size(cur_links, 1)]];
    end
end
dlmwrite('facebook_nodes_edges_map.txt', map, 'delimiter', ',', 'precision', '%i');

%1. Load time file
time = load('C:/Users/mizrachi/Documents/GitHub/octave/thesis/time/out.wikiconflict_time_final.txt');
%2. Load links file
links = load('C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-out.wikiconflict-links.txt');
years = (2001:2009);
months = [1 6];
nodes = [];
%3. Filter nodes from time file per up to some date (make sure we have at
%   least 10 time samples)
map = zeros(0, 2);
for year = years
    for month = months
        %4. Filter links - only links where both source and sink nodes pass the filter
        %   should be included
        nodes = time(time(:, 2) < year | (time(:, 2) == year & time(:, 3) <= month), 1);
        links_of_src_nodes = ismember(links(:, 1), nodes);
        links_of_dst_nodes = ismember(links(:, 2), nodes);
        cur_links = links(links_of_src_nodes & links_of_dst_nodes, :);
        map = [map ; [numel(nodes) size(cur_links, 1)]];
    end
end
dlmwrite('wikiconflict_nodes_edges_map.txt', map, 'delimiter', ',', 'precision', '%i');


% %1. Load time file
% time = load('C:/Users/mizrachi/Documents/GitHub/octave/thesis/time/brightkite_time_final.txt');
% %2. Load links file
% links = load('C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-Brightkite_edges.txt');
% years = [2008 2009];
% months = (1:12);
% nodes = [];
% %3. Filter nodes from time file per up to some date (make sure we have at
% %   least 10 time samples)
% map = zeros(0, 2);
% for year = years
%     for month = months
%         %4. Filter links - only links where both source and sink nodes pass the filter
%         %   should be included
%         cur_nodes = time(time(:, 2) == year & time(:, 3) == month, 1);
%         nodes = unique([nodes; cur_nodes]);
%         links_of_src_nodes = ismember(links(:, 1), nodes);
%         links_of_dst_nodes = ismember(links(:, 2), nodes);
%         cur_links = links(links_of_src_nodes & links_of_dst_nodes, :);
%         map = [map ; [numel(nodes) size(cur_links, 1)]];
%     end
% end
% dlmwrite('brightkite_nodes_edges_map.txt', map, 'delimiter', ',', 'precision', '%i');
% 
% 
% %1. Load time file
% time = load('C:/Users/mizrachi/Documents/GitHub/octave/thesis/time/gowalla_time_final.txt');
% %2. Load links file
% links = load('C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-Gowalla_edges.txt');
% years = [2009 2010];
% months = (1:12);
% nodes = [];
% %3. Filter nodes from time file per up to some date (make sure we have at
% %   least 10 time samples)
% map = zeros(0, 2);
% for year = years
%     for month = months
%         %4. Filter links - only links where both source and sink nodes pass the filter
%         %   should be included
%         cur_nodes = time(time(:, 2) == year & time(:, 3) == month, 1);
%         nodes = unique([nodes; cur_nodes]);
%         links_of_src_nodes = ismember(links(:, 1), nodes);
%         links_of_dst_nodes = ismember(links(:, 2), nodes);
%         cur_links = links(links_of_src_nodes & links_of_dst_nodes, :);
%         map = [map ; [numel(nodes) size(cur_links, 1)]];
%     end
% end
% dlmwrite('gowalla_nodes_edges_map.txt', map, 'delimiter', ',', 'precision', '%i');
% 
% %1. Load time file
% time = load('C:/Users/mizrachi/Documents/GitHub/octave/thesis/time/cit-HepPh_time_final.txt');
% %2. Load links file
% links = load('C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-Cit-HepPh.txt');
% years = (1992:2002);
% nodes = [];
% %3. Filter nodes from time file per up to some date (make sure we have at
% %   least 10 time samples)
% map = zeros(0, 2);
% for year = years
%     %4. Filter links - only links where both source and sink nodes pass the filter
%     %   should be included
%     cur_nodes = time(time(:, 2) == year, 1);
%     nodes = unique([nodes; cur_nodes]);
%     links_of_src_nodes = ismember(links(:, 1), nodes);
%     links_of_dst_nodes = ismember(links(:, 2), nodes);
%     cur_links = links(links_of_src_nodes & links_of_dst_nodes, :);
%     map = [map ; [numel(nodes) size(cur_links, 1)]];    
% end
% dlmwrite('cit-hepph_nodes_edges_map.txt', map, 'delimiter', ',', 'precision', '%i');


