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
    'erdos',...
    };

for k = 1:numel(MODELS)
    for j = 1:numel(DEGREES)
        
        networks{k, j} = sprintf('%s_k=%d', MODELS{k}, DEGREES(j));
        expression = sprintf('%s_%s_%d[_-]', MODELS{k}, '\d+', DEGREES(j));
%         title = sprintf('%s degree=%d', MODELS{k}, DEGREES(j));
        [reversible_filenames{k, j}, elite_non_reversible_filenames{k, j}] = ...
            getFilesFromFolderByRegExp( sprintf('./results-sim3/3/%s/binary_search/min_power', MODELS{k}), expression );
                
    end
end

num = round(rand*1000);

generateAsymptoticAnalysisFigureMinPower_3(reversible_filenames, 'The power of elite of known models over time - Reversible');
set(gcf, 'color', [1 1 1]);
saveas(gcf, sprintf('min_power_reversible_models_%d.pdf', num), 'pdf');

generateAsymptoticAnalysisFigureMinPower_3(elite_non_reversible_filenames, 'The power of elite of known models over time - Elite non-reversible');
set(gcf, 'color', [1 1 1]);
saveas(gcf, sprintf('min_power_elite_non_reversible_%d.pdf', num), 'pdf');