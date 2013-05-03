%runs the majority vote simulation
clear all; close all; clc
%

%SIMULATION #3
files = {
   
    'links/bi-jazz.txt';    
%     'links/bi-facebook-links.txt';        
%     'links/bi-Slashdot0902.txt';
%     'links/bi-soc-Epinions1.txt';
%     'links/bi-twitter.txt';
%     'links/bi-release-youtube-links.txt';
%     'links/bi-Gowalla_edges.txt';
%     'links/bi-Brightkite_edges.txt';
%     'links/bi-Cit-HepPh.txt';
%     'links/bi-Email-EuAll.txt';
%     'links/bi-DutchElite.txt';
%     'links/bi-polblogs.gml.txt';    
%     'links/bi-PGPgiantcompo.txt';
%     'links/bi-WikiTalk.txt';    
%     'links/bi-release-flickr-links.txt';  
    };

reversabilities = {'revertive', 'elite-non-revertive'};

for i = 1:numel(files);
    for j = 1:numel(reversabilities)
        linksfile = files{i};
        reversability = reversabilities{j};
        
        lastindex = strfind (strtok(linksfile, '.'), '/');
        lastindex = lastindex(end);
        
        fprintf('Loading links file %s...\n', linksfile);
        links = load(linksfile);
        
        num_nodes = numel(unique(links));
        elitepower = [1 2 4 8 16 32 64 128 256 512 1024 2048 4096 8092];
        m = size(links, 1) / 2; e = round(m ^ .5); elitesize = e;
        commonpower = 1;
        axismode = 'x-log-y-linear';
        
        for rounds = (65)
            resultsfilename = strcat(substring(strtok(linksfile, '.'), lastindex),...
                '-', axismode, '-' ,num2str(rounds), '-rounds', '-m^.5-', reversability,...
                '-results');
            result = majorityVoteSim3(links, elitepower, commonpower, elitesize, rounds, reversability)
        end
        
        fprintf('Writing results to file %s...\n', strcat(resultsfilename, '.txt'));
        dlmwrite(strcat(resultsfilename, '.txt'), result, 'delimiter', ',', 'precision', '%i');
    end
end
