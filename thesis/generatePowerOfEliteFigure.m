function [fig] = generatePowerOfEliteFigure( filenames, msquare_filenames, the_title)
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

%         rotateticklabel(gca, 90);
grid off;
ylabel ('elite size (n^y)','FontSize', 14);
% ylabel ('elite size (m^y)','FontSize', 14);
xlabel (sprintf('elite influence factor'),'FontSize', 14);
% title(the_title, 'FontWeight', 'bold', 'FontSize', 14);

colors = get(gcf,'DefaultAxesColorOrder');
colors(8, :) = [1 0.6 0.2];

legend_cell = cell(1, length(filenames));
edges = cell(1, length(filenames));
for i=1:length(filenames)
    fname = filenames{i}
    color = colors(mod(i, size(colors, 1))+1, :);
    network = getGraphTitleByName(fname);
    edges{i} = getNetworkAttribute(network, 'NumEdges');
    legend_cell{i} = network;
    result = load(fname);
    winning_points = [result(:, 1) findExponent(sum((result(:, 3:end)), 2), result(:, 2))];
%     winning_points = [result(:, 1) findExponent(edges{i}, result(:, 2))];
    X = winning_points(:, 1);
    Y = winning_points(:, 2);
    plot(X, Y, 'Color', color);
    
%     n = getGraphSizeByName(fname);
%     ytick = [0, (n.^(.1:.1:1) / n) * 100];
%     addaxis([], [], [0 100], ytick);    
%     addaxis2(winning_points(:, 1), winning_points(:, 2));    
    
end
legend(legend_cell);

for i=1:length(msquare_filenames)
    msquare_fname = msquare_filenames{i};
    color = colors(mod(i, size(colors, 1))+1, :);
    winning_point = processResults3Helper3(load(msquare_fname));
%     winning_point = processResults3Helper3(load(msquare_fname), edges{i});
    X = winning_point(1, 1);
    Y = winning_point(1, 2);
    if winning_point(1, 1) > 0
        plot(X, Y, 'o', 'MarkerSize', 6, 'Color', color, 'MarkerFaceColor', color);
    end
    
end

% for i=1:length(filenames)
%     fname = filenames{i};
%     color = colors(mod(i, size(colors, 1))+1, :);
%     network = legend_cell{i};
%     result = load(fname);
%     winning_points = [result(:, 1) findExponent(sum((result(:, 3:end)), 2), result(:, 2))];        
%     max_deg_added = addMaxDegreeToPlot(winning_points, network, color);
%     
% end

