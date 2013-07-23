function generateAsymptoticAnalysisFigureMinEliteSize( files, color, linespec )
%generateAsymptoticAnalysisFigure generates asymptotic analysis figure



axis([0 100000 0 1]);
set(gca, 'Xscale', 'log');
set(gca,'FontSize', 10);
set(gca, 'XMinorTick', 'on');
set(gca, 'XTickMode', 'manual');
set(gca, 'XTick', [1 10 100 1000 10000 100000 1000000]);
%n^x y axis
set(gca, 'YTick', (.05:.05:1));
grid off;
set(gca, 'XMinorGrid', 'off');
% ylabel ('elite size (n^y)', 'FontSize', 14);
ylabel ('elite size (m^y)', 'FontSize', 14);
xlabel ('network size (number of nodes)', 'FontSize', 14);

%collecting results for same (avg.) degree but different file size.
resultMap = containers.Map;
for i = 1:numel(files)
    file = files{i}
    %extracting graph parameters
    [~, remain] = strtok(file, '_');
    [~, remain] = strtok(remain, '_');
    [nodes, remain] = strtok(remain, '_');
    degree = strtok(remain, '_');
    if ~isempty(find (isstrprop(degree, 'digit') == 0, 1))
        degree = strtok(degree, '-');
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
    [nodes, remain] = strtok(key, '_');
    [degree, ~] = strtok(remain, '_');
    edges = str2double(nodes) * str2double(degree);

    winning_points(i, 1) = str2double(nodes);
%     winning_points(i, 2:4) = findExponent(str2double(nodes), result([1 2 3], 2))';
    winning_points(i, 2:4) = findExponent(edges, result([1 2 3], 2))';
end

winning_points = sortrows(winning_points, 1);
plot(winning_points(:, 1), winning_points(:, 2), linespec, 'Color', color);


