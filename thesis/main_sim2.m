%runs the majority vote simulation
clear all; close all; clc
files = {
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-jazz.txt';    
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-soc-Epinions1.txt';
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-Email-EuAll.txt';
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-DutchElite.txt';
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-polblogs.gml.txt';    
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-PGPgiantcompo.txt';
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-WikiTalk.txt';

    'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-facebook-links.txt';        
    'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-Slashdot0902.txt';    
    'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-twitter.txt';
    'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-release-youtube-links.txt';
    'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-Gowalla_edges.txt';
    'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-Brightkite_edges.txt';
    'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-Cit-HepPh.txt';
    'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-release-flickr-links.txt';    
    };
reversabilities = {'revertive' 'elite-non-revertive'};
elitepower = [1 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192];
commonpower = 1;
axismode = 'x-log-y-linear';

for j = 1:numel(reversabilities)
    reversability = reversabilities{j};
    for i = 1:numel(files)
        linksfile = files{i};
        graphname = getGraphTitleByName(linksfile);
        fprintf('Loading links file %s...\n', linksfile);
        links = load(linksfile);
        lastindex = strfind (strtok(linksfile, '.'), '/');
        if numel(lastindex) == 0
            lastindex = 0;
        else
            lastindex = lastindex(end);
        end
        
        %SIMULATION #2        
        for rounds = [1 2 4 8 16 32 64 128]
            resultsfilename = strcat(substring(strtok(linksfile, '.'), lastindex),...
                '-elite-m^0.5-', axismode, '-' ,num2str(rounds), '-rounds', '-',...
                reversability, '-results');
            majorityVoteSim2(links, resultsfilename, axismode, elitepower, commonpower, rounds, reversability, graphname);
        end
    end
end




% %SIMULATION #3
% num_nodes = numel(unique(links));
% elitepower = [1 2 4 8 16 32 64 128 256 512 1024 2048];
% elitesize = unique(round(num_nodes.^(0.1:0.1:1.0)));
% commonpower = 1;
% axismode = 'x-log-y-linear';
% 
% for rounds = (63)
% 	resultsfilename = strcat(substring(strtok(linksfile, '.'), lastindex),...
% 	'-', axismode, '-' ,num2str(rounds), '-rounds', '-', reversability,...
%     '-results');
% 	result = majorityVoteSim3(links, elitepower,...
%         commonpower, elitesize, rounds, reversability);
% end
% 
% fprintf('Writing results to file %s...\n', strcat(resultsfilename, '.txt'));
% csvwrite ( strcat(resultsfilename, '.txt'), result);


