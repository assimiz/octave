function generateRealBaErCompFigure(...
    filename, barabasi_filename, erdos_filename,...
    filename_m_square, barabasi_filename_m_square, erdos_filename_m_square,...
    reversability )
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
set(gca, 'YTick', (.05:.05:1));
n = getGraphSizeByName(filename);
ytick = [0, (n.^(.1:.1:1) / n) * 100];
addaxis([],[], [0 100], ytick);
%         rotateticklabel(gca, 90);
grid on;
ylabel ('elite size (n^x)');
xlabel (sprintf('elite power\n'));
title(strcat(getGraphTitleByName(filename), ' - ', reversability), 'FontWeight', 'bold', 'FontSize', 10);

%line
result = load(filename);
winning_points = [result(:, 1) findExponent(sum((result(:, 3:end)), 2), result(:, 2))];
plot(winning_points(:, 1), winning_points(:, 2), '-bo');

result = load(barabasi_filename);
winning_points = [result(:, 1) findExponent(sum((result(:, 3:end)), 2), result(:, 2))];
plot(winning_points(:, 1), winning_points(:, 2), '-r.');

result = load(erdos_filename);
winning_points = [result(:, 1) findExponent(sum((result(:, 3:end)), 2), result(:, 2))];
p = plot(winning_points(:, 1), winning_points(:, 2), '-gx');
set(p,'Color',[0.2 0.5 0.3])

%point
winning_point = processResults3Helper2(load(filename_m_square));
if winning_point(1, 1) > 0
    plot(winning_point(1, 1), winning_point(1, 2), '-bo', 'MarkerSize', 9, 'LineWidth', 2);
end

winning_point = processResults3Helper2(load(barabasi_filename_m_square));
if winning_point(1, 1) > 0
    plot(winning_point(1, 1), winning_point(1, 2), '-r.', 'MarkerSize', 20); 
end

winning_point = processResults3Helper2(load(erdos_filename_m_square));
if winning_point(1, 1) > 0
    p = plot(winning_point(1, 1), winning_point(1, 2), '-gx', 'MarkerSize', 10, 'LineWidth', 2);       
    set(p,'Color',[0.2 0.5 0.3])
end

legend ('real', 'barabasi', 'erdos');

end

