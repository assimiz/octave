function [fig] = generateReversabilityCompFigure( reversible_filename, ...
    elite_non_reversible_filename,  reversible_m_square_filename,...
    elite_non_reversible_m_square_filename)
%generateReversabilityCompFigure generates reversability comparison figure


fig = figure;
hold on;
axis([0 10000 0 1]);
set(gca, 'Xscale', 'log');
set(gca, 'YMinorGrid', 'off');
set(gca,'FontSize', 8);
set(gca, 'XMinorTick', 'on');
set(gca, 'XTickMode', 'manual');
set(gca, 'XTick', [1 2 4 8 16 32 64 128 256 512 1024 2048 4096 8092]);
%n^x y axis
set(gca, 'YTick', (.05:.05:1));
n = getGraphSizeByName(reversible_filename);
% percent y axis
%FIXME use num2str to show only 3 digits after the decimal point
ytick = [0, (n.^(.1:.1:1) / n) * 100];
addaxis([],[], [0 100], ytick);
%         rotateticklabel(gca, 90);
grid on;
ylabel ('elite size (n^x)');
xlabel (sprintf('elite power\n'));
title(getGraphTitleByName(reversible_filename), 'FontWeight', 'bold', 'FontSize', 10);

result = load(reversible_filename);
winning_points = [result(:, 1) findExponent(sum((result(:, 3:end)), 2), result(:, 2))];
plot(winning_points(:, 1), winning_points(:, 2), '-bo');

result = load(elite_non_reversible_filename);
winning_points = [result(:, 1) findExponent(sum((result(:, 3:end)), 2), result(:, 2))];
plot(winning_points(:, 1), winning_points(:, 2), '-r.');

winning_point = processResults3Helper3(load(reversible_m_square_filename));
if winning_point(1, 1) > 0
    plot(winning_point(1, 1), winning_point(1, 2), '-bo','MarkerSize', 8, 'LineWidth', 2);
end

winning_point = processResults3Helper3(load(elite_non_reversible_m_square_filename));
if winning_point(1, 1) > 0
    plot(winning_point(1, 1), winning_point(1, 2), '-r.', 'MarkerSize', 19);
end


legend ('reversible', '(elite) non-reversible');

end

