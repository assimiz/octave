function generateTimeAnalysisFigureMinPower( files, fig_title )
%generateAsymptoticAnalysisFigure generates asymptotic analysis figure


figure;
hold on;
axis([0 100000 0 10]);
%set(gca, 'Xscale', 'log');
% set(gca, 'YMinorGrid', 'off');
set(gca,'FontSize', 8);
set(gca, 'XMinorTick', 'on');
set(gca, 'XTickMode', 'manual');
%set(gca, 'XTick', [1 10 100 1000 10000 100000]);
%n^x y axis
%set(gca, 'YTick', (1:10));
grid on;
ylabel ('elite weight');
xlabel (sprintf('n\n'));
title(fig_title, 'FontWeight', 'bold', 'FontSize', 10);

files = sort(files);
max_power = 0;
for i = 1:numel(files)
    file = files{i}
    [~, remain] = strtok(file, '=');
    [str, ~] = strtok(remain, '=');
    [nodes, ~] = strtok(str, '.');
    [nodes, ~] = strtok(nodes, '-');
    %aggregating result
    result = load(file);
    winning_points(i, :) = [str2double(nodes) result([1 2 3], 5)']; 
    max_power = max(result([1 2 3], 5));
end
winning_points = sortrows(winning_points, 1);
plot(winning_points(:, 1), winning_points(:, 2), 'r-x');
plot(winning_points(:, 1), winning_points(:, 3), 'b-o');
plot(winning_points(:, 1), winning_points(:, 4), 'm-^');

axis([0 str2double(nodes) 0 10]);
l = legend('$e=\sqrt{n}$', '$e=\sqrt{m}$', '$e=0.1n$');
set(l,'interpreter','latex')

