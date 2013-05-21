function generateTimeAnalysisFigureMinEliteSize( files, nodes_edges_map, fig_title )
%generateAsymptoticAnalysisFigure generates asymptotic analysis figure


figure;
hold on;
axis([0 100000 0 1]);
%set(gca, 'Xscale', 'log');
% set(gca, 'YMinorGrid', 'off');
set(gca,'FontSize', 8);
set(gca, 'XMinorTick', 'on');
set(gca, 'XTickMode', 'manual');
%set(gca, 'XTick', [1 10 100 1000 10000 100000]);
%n^x y axis
set(gca, 'YTick', (.05:.05:1));
grid on;
ylabel ('elite size (n^x)');
xlabel (sprintf('n\n'));
title(fig_title, 'FontWeight', 'bold', 'FontSize', 10);

for i = 1:numel(files)
    file = files{i}
    [~, remain] = strtok(file, '=');
    [str, ~] = strtok(remain, '=');
    [nodes, ~] = strtok(str, '-');
    [nodes, ~] = strtok(nodes, '.');
    [nodes, ~] = strtok(nodes, '_');
    edges = unique(nodes_edges_map(nodes_edges_map(:, 1) == str2double(nodes), 2), 'rows');
    %aggregating result
    result = load(file);
    winning_points(i, 1) = str2double(nodes);
    winning_points(i, 2:4) = findExponent(str2double(nodes), result([1 2 3], 2))';
    winning_points(i, 5) = findExponent(str2double(nodes), power(edges, 0.5));    
end
winning_points = sortrows(winning_points, 1);
plot(winning_points(:, 1), winning_points(:, 2), 'r-x');
plot(winning_points(:, 1), winning_points(:, 3), 'b-o');
plot(winning_points(:, 1), winning_points(:, 4), 'm-^');
plot(winning_points(:, 1), winning_points(:, 5), 'k--', 'LineWidth', 2);

axis([0 str2double(nodes) 0 1]);
l = legend('w=1', 'w=2', 'w=4', '$\sqrt{m}$');
set(l,'interpreter','latex');


