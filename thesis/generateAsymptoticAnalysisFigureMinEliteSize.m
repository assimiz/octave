function generateAsymptoticAnalysisFigureMinEliteSize( files, nodes_edges_map, fig_title )
%generateAsymptoticAnalysisFigure generates asymptotic analysis figure


figure;
hold on;
axis([0 100000 0 1]);
set(gca, 'Xscale', 'log');
set(gca,'FontSize', 8);
set(gca, 'XMinorTick', 'on');
set(gca, 'XTickMode', 'manual');
set(gca, 'XTick', [1 10 100 1000 10000 100000]);
%n^x y axis
set(gca, 'YTick', (.05:.05:1));
grid on;
set(gca, 'XMinorGrid', 'off');
ylabel ('elite size (n^x)');
xlabel (sprintf('n\n'));
title(fig_title, 'FontWeight', 'bold', 'FontSize', 10);

%collecting results for same (avg.) degree but different file size.
resultMap = containers.Map;
for i = 1:numel(files)
    file = files{i}
    %extracting graph parameters
    [~, remain] = strtok(file, '_');
    [~, remain] = strtok(remain, '_');
    [nodes, remain] = strtok(remain, '_');
    degree = strtok(remain, '_');
    if ~isnumeric(degree)
        degree = strtok(remain, '-');
    end
    %aggregating result
    result = load(file);
    key = sprintf('%d_%d', str2double(nodes), str2double(degree));
    if isKey(resultMap,key)
        resultMap(key) = [resultMap(key) result(:, 2)];
    else
        resultMap(key) = result(:, 1:2);
    end
end

the_keys = keys(resultMap);
for i = 1:numel(the_keys)
    key = the_keys{i};
    result = resultMap(key);
    %taking average of all instances
    result = [result(:, 1) mean(result(:, 2:end), 2)];
    nodes = strtok(key, '_');
    edges = unique(nodes_edges_map(nodes_edges_map(:, 1) == str2double(nodes), 2), 'rows');

    winning_points(i, 1) = str2double(nodes)
    winning_points(i, 2:4) = findExponent(str2double(nodes), result([1 2 3], 2))'
    winning_points(i, 5) = findExponent(str2double(nodes), power(edges, 0.5))
end

winning_points = sortrows(winning_points, 1);
plot(winning_points(:, 1), winning_points(:, 2), 'r-x');
plot(winning_points(:, 1), winning_points(:, 3), 'b-o');
plot(winning_points(:, 1), winning_points(:, 4), 'm-^');
plot(winning_points(:, 1), winning_points(:, 5), 'k--', 'LineWidth', 2);

% axis([0 str2double(nodes) 0 1]);
l = legend('w=1', 'w=2', 'w=4', '$\sqrt{m}$', 'Location', 'SouthEast');
set(l,'interpreter','latex');


