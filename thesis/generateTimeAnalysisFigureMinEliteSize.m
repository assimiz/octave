function generateTimeAnalysisFigureMinEliteSize( files, nodes_edges_map, fig_title, networks )
%generateAsymptoticAnalysisFigure generates asymptotic analysis figure


figure;
hold on;
axis([0 100 0 1]);
%set(gca, 'Xscale', 'log');
% set(gca, 'YMinorGrid', 'off');
set(gca,'FontSize', 10);
set(gca, 'XMinorTick', 'on');
set(gca, 'XTickMode', 'manual');
%set(gca, 'XTick', [1 10 100 1000 10000 100000]);
%n^x y axis
set(gca, 'YTick', (.05:.05:1));
grid off;
% ylabel ('elite size (n^y)', 'FontSize', 14);
ylabel ('elite size (m^y)', 'FontSize', 14);
xlabel ('network size(%)', 'FontSize', 14);
% title(fig_title, 'FontWeight', 'bold', 'FontSize', 14);

colors = get(gcf,'DefaultAxesColorOrder');
colors(8, :) = [1 0.6 0.2];
legend_cell = cell(1, length(networks));

for j=1:length(networks)
    legend_cell{j} = getGraphTitleByName(networks{j});
    color = colors(mod(j, size(colors, 1))+1, :);
    cur_files = files{j};
    winning_points = zeros(length(cur_files), 2);
    for i = 1:numel(cur_files)        
        file = cur_files{i};
        [~, remain] = strtok(file, '-');
        [remain, ~] = strtok(remain, '-');
        while ~isempty(strfind(remain, '\'))
            [head, remain] = strtok(remain, '\');
        end        
        network = head;
        if strcmpi(network, networks{j})
            [~, remain] = strtok(file, '=');
            [str, ~] = strtok(remain, '=');
            [nodes, ~] = strtok(str, '.');
            [nodes, ~] = strtok(nodes, '-');
            [nodes, ~] = strtok(nodes, '_');
            edges = unique(nodes_edges_map{j}(nodes_edges_map{j}(:, 1) == str2double(nodes), 2), 'rows');
            %aggregating result
            result = load(file);
            winning_points(i, 1) = str2double(nodes);
%             winning_points(i, 2) = findExponent(str2double(nodes), result(3, 2))';
            winning_points(i, 2) = findExponent(edges, result(3, 2))';
        end
    end
    
    winning_points(:, 1) = (winning_points(:, 1) ./ winning_points(end, 1)) * 100;
    winning_points = sortrows(winning_points, 1);
    X = winning_points(:, 1);
    Y = winning_points(:, 2);
    plot(X, Y, 'Color', color);  
    
end

legend(legend_cell, 'Location', 'NorthWest');


