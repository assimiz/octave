function generateAsymptoticAnalysisFigure( files, fig_title )
%generateAsymptoticAnalysisFigure generates asymptotic analysis figure


figure;
hold on;
axis([0 10000 0 1]);
set(gca, 'Xscale', 'log');
% set(gca, 'YMinorGrid', 'off');
set(gca,'FontSize', 8);
set(gca, 'XMinorTick', 'on');
set(gca, 'XTickMode', 'manual');
set(gca, 'XTick', [1 2 4 8 16 32 64 128 256 512 1024 2048 4096 8092]);
%n^x y axis
set(gca, 'YTick', (.05:.05:1));
% set(gca, 'Yscale', 'log');
% set(gca, 'YTick', 1 ./ (2 .^ [10:-1:0]));
grid on;
ylabel ('elite size (n\timesx)');
xlabel (sprintf('elite power\n'));
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

    winning_points(:, 1) = result(:, 1);
    winning_points(:, i+1) = findExponent(str2double(nodes), result(:, 2));
%     winning_points(:, i+1) = result(:, 2) / str2double(nodes); 
    legend_set{i} = num2str(nodes);
end

plot(winning_points(:, 1), winning_points(:, 2:end), '-x');
legend(legend_set);

winning_points



