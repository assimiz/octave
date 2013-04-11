%runs the majority vote simulation
%clear all;
close all; clc
%

%SIMULATION #3
files = {
%     'links/bi-ba_gowalla.txt'
%     'links/bi-er_gowalla.txt'
%     'links/bi-ba_brightkite.txt'
%     'links/bi-er_brightkite.txt'
%     'links/bi-ba_Cit-HepPh.txt'
%     'links/bi-er_Cit-HepPh.txt'
%     'links/bi-ba_wikitalk.txt'
%     'links/bi-er_wikitalk.txt'
%     'links/bi-ba_facebook.txt'
%     'links/bi-er_facebook.txt'
%     'links/bi-ba_slashdot.txt'
%     'links/bi-er_slashdot.txt'
%     'links/bi-ba_epinions.txt'
%     'links/bi-er_epinions.txt'
%     'links/bi-ba_youtube.txt'
%     'links/bi-er_youtube.txt'
%     'links/bi-ba_twitter.txt'
%     'links/bi-er_twitter.txt'
%     'links/bi-ba_flickr.txt'
%     'links/bi-er_flickr.txt'

    'links/bi-jazz.txt';    
    'links/bi-facebook-links.txt';        
    'links/bi-Slashdot0902.txt';
    'links/bi-soc-Epinions1.txt';
    'links/bi-twitter.txt';
    'links/bi-release-youtube-links.txt';
    'links/bi-Gowalla_edges.txt';
    'links/bi-Brightkite_edges.txt';
    'links/bi-Cit-HepPh.txt';
    'links/bi-Email-EuAll.txt';
    'links/bi-DutchElite.txt';
    'links/bi-polblogs.gml.txt';    
    'links/bi-PGPgiantcompo.txt';
    'links/bi-WikiTalk.txt';    
    'links/bi-release-flickr-links.txt';    
    };

REVERSABILITIES = {'revertive', 'elite-non-revertive'};
ROUNDS = 65;%proved to be enough (x2 than diameter) for all networks
ELITE_POWERS = [1 2 4 8 16 32 64 128 256 512 1024 2048 4096 8092];
COMMON_POWER = 1;
FACTOR_PRECISION = 2;

for i = 1:numel(files);
    linksfile = files{i};
    fprintf('Loading links file %s...\n', linksfile); 
    links = load(linksfile);
    links = fixLinks(links);
    num_nodes = size(unique(links), 1);
    
    for j = 1:numel(REVERSABILITIES)
        reversability = REVERSABILITIES{j};                                      
        acc_result = zeros(numel(ELITE_POWERS), 5);
        fprintf('Simulating for file %s and reversability %s...\n\n', linksfile, reversability);
        factor = 1.0
        step = 0.5;
        for k = 1:numel(ELITE_POWERS)            
            elite_power = ELITE_POWERS(k);                        
            prev_factor = -1.00;     
            fprintf('Searching for minimum elite size for power %d...\n\n', elite_power);
            while ~strcmpi(num2str(factor, FACTOR_PRECISION), num2str(prev_factor, FACTOR_PRECISION))
                elitesize = round(num_nodes ^ factor);                
                result = playVotingGame(links, elitesize, num_nodes, elite_power, COMMON_POWER, ROUNDS, reversability);
                num_dislike_voters = result(2);
                num_like_voters = result(4);                
                %if elite won for this size, try smaller elite, else try
                %bigger.
                step = step / 2
                prev_factor = factor;
                if num_like_voters >= num_dislike_voters
                    factor = prev_factor - step
                    min_win_result = result;
                else
                    factor = prev_factor + step                    
                end
                                
            end
            acc_result(k, :) = [elite_power min_win_result];
            step = factor / 2
        end
        
        %writing the result to a file
        lastindex = strfind (strtok(linksfile, '.'), '/');
        lastindex = lastindex(end);        
        resultsfilename = strcat(substring(strtok(linksfile, '.'), lastindex),...
                '-',num2str(ROUNDS), '-rounds', '-binary_search-', reversability,...
                '-results');
        fprintf('Writing results to file %s...\n', strcat(resultsfilename, '.txt'));
        csvwrite ( strcat(resultsfilename, '.txt'), acc_result);
    end
end
