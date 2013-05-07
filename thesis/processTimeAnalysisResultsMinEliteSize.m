%clear all; 
close all;
%clc

networks = {...    
%     'gowalla',...
%     'cit-hepph',...
    'brightkite'
    };

for i = 1:numel(networks)
    network = networks{i};
    title = network;
    [reversible_filenames, elite_non_reversible_filenames] = ...
        getFilesFromFolder(sprintf('./results-sim3/4/%s/asymptotic', network), '-');    
    
    generateTimeAnalysisFigureMinEliteSize(reversible_filenames, strcat(title, ' reversible'));
    set(gcf, 'color', [1 1 1])
    I = getframe(gcf);
    imwrite(I.cdata, strcat('min_elite_size_reversible_', network, '.png'));
    
    generateTimeAnalysisFigureMinEliteSize(elite_non_reversible_filenames, strcat(title, ' elite non-reversible'));
    set(gcf, 'color', [1 1 1])
    I = getframe(gcf);
    imwrite(I.cdata, strcat('min_elite_size_elite_non_reversible_', network, '.png'));
    
end