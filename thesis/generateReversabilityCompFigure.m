function [fig] = generateReversabilityCompFigure( reversible_filename, ...
    elite_non_reversible_filename,  reversible_m_square_filename,...
    elite_non_reversible_m_square_filename, network)
%generateReversabilityCompFigure generates reversability comparison figure


fig = figure;
hold on;
axis([0 10000 0 1]);
set(gca, 'Xscale', 'log');
set(gca, 'YMinorGrid', 'off');
set(gca,'FontSize', 10);
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
ylabel ('elite size (n^x)','FontSize', 14);
xlabel (sprintf('elite weight'),'FontSize', 14);
title(getGraphTitleByName(reversible_filename), 'FontWeight', 'bold', 'FontSize', 14);

result = load(reversible_filename);
winning_points_rev = [result(:, 1) findExponent(sum((result(:, 3:end)), 2), result(:, 2))];
plot(winning_points_rev(:, 1), winning_points_rev(:, 2), '-bo');

result = load(elite_non_reversible_filename);
winning_points_nonrev = [result(:, 1) findExponent(sum((result(:, 3:end)), 2), result(:, 2))];
plot(winning_points_nonrev(:, 1), winning_points_nonrev(:, 2), '-r.');

max_deg_added = addMaxDegreeToPlot(winning_points_rev, network);
max_deg_added = max_deg_added & addMaxDegreeToPlot(winning_points_nonrev, network);

winning_point = processResults3Helper3(load(reversible_m_square_filename));
if winning_point(1, 1) > 0
    plot(winning_point(1, 1), winning_point(1, 2), '-bo','MarkerSize', 8, 'LineWidth', 2);
end

winning_point = processResults3Helper3(load(elite_non_reversible_m_square_filename));
if winning_point(1, 1) > 0
    plot(winning_point(1, 1), winning_point(1, 2), '-r.', 'MarkerSize', 19);
end

% if max_deg_added
%     legend ('reversible', '(elite) non-reversible', 'max degree');
% else
    legend ('reversible', 'elite-non-reversible');
% end
end

