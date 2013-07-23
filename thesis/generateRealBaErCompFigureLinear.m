function generateRealBaErCompFigureLinear(...
    filenames, barabasi_filenames, erdos_filenames,...
    filenames_m_square, barabasi_filenames_m_square, erdos_filenames_m_square,...
    reversability )
%processReversabilityCompFigure generates reversability comparison figure


figure;
hold on;
axis([0 10000 0 100]);
% set(gca, 'Xscale', 'log');
set(gca, 'YMinorGrid', 'off');
set(gca,'FontSize', 10);
set(gca, 'XMinorTick', 'on');
set(gca, 'XTickMode', 'manual');
% set(gca, 'XTick', [1 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192]);
% set(gca, 'YTick', (.05:.05:1));
% n = getGraphSizeByName(filenames);
% ytick = [0, (n.^(.1:.1:1) / n) * 100];
% addaxis([],[], [0 100], ytick);
%         rotateticklabel(gca, 90);
grid off;
ylabel ('elite size (n^x)', 'FontSize', 14);
xlabel ('elite weight', 'FontSize', 14);
title(sprintf('%s - %s', 'Real vs. Models', reversability), 'FontWeight', 'bold', 'FontSize', 14);

colors = get(gcf,'DefaultAxesColorOrder');
colors(8, :) = [1 0.6 0.2];
legend_cell = cell(1, length(filenames));

for i=1:length(filenames)             
    
    fname = filenames{i};
    legend_cell{i} = getGraphTitleByName(fname);    
    color = colors(mod(i, size(colors, 1))+1, :);
    result = load(fname);
    winning_points = [result(:, 1) findExponent(sum((result(:, 3:end)), 2), result(:, 2))];
    X = winning_points(:, 1);
    Y = winning_points(:, 2);
    plot(X, Y, '-', 'Color', color, 'LineWidth', 1);    
    
end
legend(legend_cell);

for i=1:length(filenames)             
    
    %m^.5 points
    color = colors(mod(i, size(colors, 1))+1, :);
    winning_point = processResults3Helper3(load(filenames_m_square{i}));
    X = winning_point(1, 1);
    Y = winning_point(1, 3);
    if winning_point(1, 1) > 0
        plot(X, Y, 'o', 'MarkerSize', 6, 'Color', color, 'MarkerFaceColor', color);
    end
    
end

for i=1:length(erdos_filenames)     
    
    fname = erdos_filenames{i};
    color = colors(mod(i, size(colors, 1))+1, :);
    result = load(fname);
    winning_points = [result(:, 1) findExponent(sum((result(:, 3:end)), 2), result(:, 2))];
    X = winning_points(:, 1);
    Y = winning_points(:, 2);
    plot(X, Y, '-', 'Color', color);   
    
    %m^.5 points
    winning_point = processResults3Helper3(load(erdos_filenames_m_square{i}));
    X = winning_point(1, 1);
    Y = winning_point(1, 2);
    if winning_point(1, 1) > 0
        plot(X, Y, '^', 'MarkerSize', 6, 'Color', color, 'MarkerFaceColor', color);
    end
    
end

for i=1:length(barabasi_filenames)         
    
    fname = barabasi_filenames{i};
    color = colors(mod(i, size(colors, 1))+1, :);
    result = load(fname);
    winning_points = [result(:, 1) findExponent(sum((result(:, 3:end)), 2), result(:, 2))];
    X = winning_points(:, 1);
    Y = winning_points(:, 2);
    plot(X, Y, '--', 'Color', color);  
    
    %m^.5 points
    winning_point = processResults3Helper3(load(barabasi_filenames_m_square{i}));
    X = winning_point(1, 1);
    Y = winning_point(1, 3);
    if winning_point(1, 1) > 0
        plot(X, Y, 's', 'MarkerSize', 6, 'Color', color, 'MarkerFaceColor', color);
    end
    
end


%1580, 0.66
text(256, 093.1, sprintf('solid     - erdos\ndashed - barabasi\nbold      - real'), 'EdgeColor', 'black', 'LineWidth', 0.5);
% text(256, 0.93, sprintf('dotted    - erdos\ndashed - barabasi\nsolid      - real'), 'EdgeColor', 'black');

end

