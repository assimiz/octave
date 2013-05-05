function generateTimeAnalysisFigure( files, fig_title )
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
grid on;
ylabel ('elite size (n\timesx)');
xlabel (sprintf('elite power\n'));
title(fig_title, 'FontWeight', 'bold', 'FontSize', 10);

files = sort(files);
for i = 1:numel(files)
    file = files{i}
    [~, remain] = strtok(file, '=');
    [str, ~] = strtok(remain, '=');
%     [nodes, ~] = strtok(str, '.');
    [nodes, ~] = strtok(str, '-');
    leg{i} = nodes;
    %aggregating result
    result = load(file);
    winning_points(:, 1) = result(:, 1);
    winning_points(:, i+1) = findExponent(str2double(nodes), result(:, 2));
end

plot(winning_points(:, 1), winning_points(:, 2:end), '-x');
legend(leg);




