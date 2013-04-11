function [] = generateReversabilityCompFigure( reversible_filename, ...
    elite_non_reversible_filename,  reversible_m_square_filename,...
    elite_non_reversible_m_square_filename)
%processReversabilityCompFigure generates reversability comparison figure


figure;
hold on;
axis([0 3050 0 1]);
set(gca, 'Xscale', 'log');
set(gca, 'YMinorGrid', 'off');
set(gca,'FontSize', 8);
set(gca, 'XMinorTick', 'on');
set(gca, 'XTickMode', 'manual');
set(gca, 'XTick', [1 2 4 8 16 32 64 128 256 512 1024 2048]);
%n^x y axis
set(gca, 'YTick', (.05:.05:1));
n = getGraphSizeByName(reversible_filename);
% percent y axis
ytick = [0, (n.^(.1:.1:1) / n) * 100];
addaxis([],[], [0 100], ytick);
%         rotateticklabel(gca, 90);
grid on;
ylabel ('elite size (n^x)');
xlabel (sprintf('elite power\n'));
title(getGraphTitleByName(reversible_filename), 'FontWeight', 'bold', 'FontSize', 10);

winning_points = processResult3Helper(load(reversible_filename));
plot(winning_points(:, 1), winning_points(:, 2), '-bo');

winning_points = processResult3Helper(load(elite_non_reversible_filename));
plot(winning_points(:, 1), winning_points(:, 2), '-r.');

winning_point = processResults3Helper2(load(reversible_m_square_filename));
if winning_point(1, 1) > 0
    plot(winning_point(1, 1), winning_point(1, 2), '-b*');
end

winning_point = processResults3Helper2(load(elite_non_reversible_m_square_filename));
if winning_point(1, 1) > 0
    plot(winning_point(1, 1), winning_point(1, 2), '-r*');
end


legend ('reversible', '(elite) non-reversible');

end

