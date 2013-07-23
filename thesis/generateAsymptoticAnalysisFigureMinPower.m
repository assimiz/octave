function generateAsymptoticAnalysisFigureMinPower( files, color, linespec )
%generateAsymptoticAnalysisFigure generates asymptotic analysis figure


% figure;
% hold on;
axis([0 1000000 0 15]);
set(gca, 'Xscale', 'log');
set(gca,'FontSize', 10);
set(gca, 'XMinorTick', 'on');
set(gca, 'XTickMode', 'manual');
set(gca, 'XTick', [1 10 100 1000 10000 100000 1000000]);
%n^x y axis
% set(gca, 'YTick', (.05:.05:1));
grid off;
ylabel ('elite influence factor', 'FontSize', 14);
xlabel ('network size (number of nodes)', 'FontSize', 14);
% title(fig_title, 'FontWeight', 'bold', 'FontSize', 14);

%collecting results for same (avg.) degree but different file size.
resultMap = containers.Map;
for i = 1:numel(files)
    file = files{i};
    %extracting graph parameters
    [~, remain] = strtok(file, '_');
    [~, remain] = strtok(remain, '_');
    [~, remain] = strtok(remain, '_');
    [nodes, remain] = strtok(remain, '_');
    degree = strtok(remain, '_');
    if ~isnumeric(degree)
        degree = strtok(degree, '-');
    end
    %aggregating result
    result = load(file);
    key = sprintf('%d_%d', str2double(nodes), str2double(degree));
    if isKey(resultMap,key)
        resultMap(key) = [resultMap(key) result(:, 5)];
    else
        resultMap(key) = result(:, [1, 5]);
    end
end

the_keys = keys(resultMap);
for i = 1:numel(the_keys)
    key = the_keys{i};
    result = resultMap(key);
    %taking average of all instances
    result = [result(:, 1) mean(result(:, 2:end), 2)];
    nodes = strtok(key, '_');
    winning_points(i, :) = [str2double(nodes) result([1 2 3], 2)']; 
end

winning_points = sortrows(winning_points, 1);
% winning_points(:, 1) = (winning_points(:, 1) ./ winning_points(end, 1)) * 100;
plot(winning_points(:, 1), winning_points(:, 3), linespec, 'Color', color);
% plot(winning_points(:, 1), winning_points(:, 3), 'b-o');
% plot(winning_points(:, 1), winning_points(:, 4), 'm-^');

% l = legend('$e=\sqrt{n}$', '$e=\sqrt{m}$', '$e=0.1n$');
% set(l,'interpreter','latex')


