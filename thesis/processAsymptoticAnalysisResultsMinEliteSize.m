%clear all; 
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
    'barabasi',...
%     'erdos',...
    };

for k = 1:numel(MODELS)
    for j = 1:numel(DEGREES)
        
        network = sprintf('%s_k=%d', MODELS{k}, DEGREES(j));
        expression = sprintf('%s_%s_%d[_-]', MODELS{k}, '\d+', DEGREES(j));
        title = sprintf('%s degree=%d', MODELS{k}, DEGREES(j));
        [reversible_filenames, elite_non_reversible_filenames] = ...
            getFilesFromFolderByRegExp( sprintf('./results-sim3/3/%s/binary_search/asymptotic', MODELS{k}), expression );
        
        nodes_edges_map = [NODES' NODES'*DEGREES(j)];
        
        generateAsymptoticAnalysisFigureMinEliteSize(reversible_filenames, nodes_edges_map, strcat(title, ' reversible'));
        set(gcf, 'color', [1 1 1])
        I = getframe(gcf);
        imwrite(I.cdata, strcat('asymptotic_min_elite_size_reversible_', network, '.png'));
        
        generateAsymptoticAnalysisFigureMinEliteSize(elite_non_reversible_filenames, nodes_edges_map, strcat(title, ' elite non-reversible'));
        set(gcf, 'color', [1 1 1])
        I = getframe(gcf);
        imwrite(I.cdata, strcat('asymptotic_min_elite_size_elite_non_reversible_', network, '.png'));
    end
end