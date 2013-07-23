function generateTimeAnalysisFigureMinPower( files, fig_title, networks )
%generateAsymptoticAnalysisFigure generates asymptotic analysis figure


figure;
hold on;
axis([0 100 0 10]);
%set(gca, 'Xscale', 'log');
% set(gca, 'YMinorGrid', 'off');
set(gca,'FontSize', 10);
set(gca, 'XMinorTick', 'on');
set(gca, 'XTickMode', 'manual');
%set(gca, 'XTick', [1 10 100 1000 10000 100000]);
%n^x y axis
%set(gca, 'YTick', (1:10));
grid off;
ylabel ('elite influence factor', 'FontSize', 14);
xlabel ('network size(%)', 'FontSize', 14);
% t = title(fig_title, 'FontWeight', 'bold', 'FontSize', 14);
% set(t,'interpreter','latex')

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
            %aggregating result
            result = load(file);
            if size(result, 1) == 4
                winning_points(i, :) = [str2double(nodes) result(2, 5)'];
            else
                winning_points(i, :) = [str2double(nodes) result(1, 5)'];
            end
        end
    end
    
    winning_points(:, 1) = (winning_points(:, 1) ./ winning_points(end, 1)) * 100;
    winning_points = sortrows(winning_points, 1);
    X = winning_points(:, 1);
    Y = winning_points(:, 2);
    plot(X, Y, 'Color', color);  
    
end

legend(legend_cell, 'Location', 'NorthWest');


