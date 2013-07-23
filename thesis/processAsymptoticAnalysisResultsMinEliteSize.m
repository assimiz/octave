clear all; 
close all;
%clc

DEGREES = [...
    2,...
    4,...
    8,...
    16,...
%     32,...
%     64,...
%     128,...
%     256,...
    ];

NODES = [100, 1000, 10000, 100000, 1000000];

MODELS = {...    
    'erdos',...
    'barabasi',...
    };

num = round(rand*1000);

figure;
hold on;
LINESPEC = {'-', '--'};
for k = 1:numel(MODELS)
    colors = get(gcf,'DefaultAxesColorOrder');
    colors(8, :) = [1 0.6 0.2];
    for j = 1:numel(DEGREES)
        color = colors(mod(j, size(colors, 1))+1, :);
        network = sprintf('%s_k=%d', MODELS{k}, DEGREES(j));
        expression = sprintf('%s_%s_%d[_-]', MODELS{k}, '\d+', DEGREES(j));
        [reversible_filenames, elite_non_reversible_filenames] = ...
            getFilesFromFolderByRegExp( sprintf('./results-sim3/3/%s/binary_search/asymptotic', MODELS{k}), expression );
        
        generateAsymptoticAnalysisFigureMinEliteSize(elite_non_reversible_filenames, color, LINESPEC{k});
        
        %         generateAsymptoticAnalysisFigureMinEliteSize(elite_non_reversible_filenames, nodes_edges_map, strcat(title, ' elite non-reversible'));
    end
end

l = legend({'d=2' 'd=4' 'd=8' 'd=16'}, 'Location', 'SouthEast');
% title('The power of elite over time - Reversible', 'FontWeight', 'bold', 'FontSize', 14);
text(12200, 0.1235, sprintf('solid     - ER\ndashed - PA'), 'EdgeColor', 'black', 'LineWidth', 0.5);

set(gcf, 'color', [1 1 1]);
saveas(gcf, sprintf('min_elite_size_elite_non_reversible_models_%d.pdf', num), 'pdf');