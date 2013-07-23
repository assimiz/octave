function [fig] = generateReversabilityCompFigure_all( reversible_filenames, ...
    elite_non_reversible_filenames,  reversible_m_square_filenames,...
    elite_non_reversible_m_square_filenames, networks)
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
% n = getGraphSizeByName(reversible_filename);
% percent y axis
%FIXME use num2str to show only 3 digits after the decimal point
% ytick = [0, (n.^(.1:.1:1) / n) * 100];
% addaxis([],[], [0 100], ytick);
%         rotateticklabel(gca, 90);
grid off;
ylabel ('elite size (n^y)','FontSize', 14);
% ylabel ('elite size (m^y)','FontSize', 14);
xlabel (sprintf('elite influence factor'),'FontSize', 14);
% title('Reversible vs. Elite non-reversible', 'FontWeight', 'bold', 'FontSize', 14);

colors = get(gcf,'DefaultAxesColorOrder');
colors(8, :) = [1 0.6 0.2];
legend_cell = cell(1, length(networks));
edges = cell(1, length(networks));

for i=1:length(reversible_filenames)
    network = networks{i};
    edges{i} = getNetworkAttribute(network, 'NumEdges');
    legend_cell{i} = network;
    color = colors(mod(i, size(colors, 1))+1, :);
    result = load(reversible_filenames{i});
    winning_points_rev = [result(:, 1) findExponent(sum((result(:, 3:end)), 2), result(:, 2))];
%     winning_points_rev = [result(:, 1) findExponent(edges{i}, result(:, 2))];
    X = winning_points_rev(:, 1);
    Y = winning_points_rev(:, 2);
    plot(X, Y, '-', 'Color', color);    
   
end

for i=1:length(reversible_filenames)        
    color = colors(mod(i, size(colors, 1))+1, :);
    result = load(elite_non_reversible_filenames{i});    
    winning_points_nonrev = [result(:, 1) findExponent(sum((result(:, 3:end)), 2), result(:, 2))];
%     winning_points_nonrev = [result(:, 1) findExponent(edges{i}, result(:, 2))];
    X = winning_points_nonrev(:, 1);
    Y = winning_points_nonrev(:, 2);
    plot(X, Y, '--', 'Color', color);
    
end

for i=1:length(reversible_filenames)
    color = colors(mod(i, size(colors, 1))+1, :);
    
    networks{i}
    winning_point = processResults3Helper3(load(reversible_m_square_filenames{i}))
%     winning_point = processResults3Helper3(load(reversible_m_square_filenames{i}), edges{i});
    X = winning_point(1, 1);
    Y = winning_point(1, 2);
    if winning_point(1, 1) > 0
        plot(X, Y, 'o', 'MarkerSize', 6, 'Color', color, 'MarkerFaceColor', color);
    end
        
    winning_point = processResults3Helper3(load(elite_non_reversible_m_square_filenames{i}))
%     winning_point = processResults3Helper3(load(elite_non_reversible_m_square_filenames{i}), edges{i});
    X = winning_point(1, 1);
    Y = winning_point(1, 2);
    if winning_point(1, 1) > 0
        plot(X, Y, 'o', 'MarkerSize', 6, 'Color', color);
    end
end

legend(legend_cell);
text(180, 0.947, sprintf('solid     - Reversible\ndashed - Irreversible'), 'EdgeColor', 'black', 'LineWidth', 0.5);
end

