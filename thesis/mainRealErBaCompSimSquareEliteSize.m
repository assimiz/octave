files = {
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-jazz.txt';    
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-facebook-links.txt';        
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-Slashdot0902.txt';
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-soc-Epinions1.txt';
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-twitter.txt';
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-release-youtube-links.txt';
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-Gowalla_edges.txt';
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-Brightkite_edges.txt';
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-Cit-HepPh.txt';
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-Email-EuAll.txt';
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-DutchElite.txt';
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-polblogs.gml.txt';    
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-PGPgiantcompo.txt';
    'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-WikiTalk.txt';    
    'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-release-flickr-links.txt';    
    };

ELITE_POWERS = [1 2 4 8 16 32 64 128 256 512 1024 2048 4096 8092];
ITERATIONS = 10;
ROUNDS = 65;%proved to be enough (x2 than diameter) for all networks
REVERSABILITIES = {'revertive', 'elite-non-revertive'};

for j = 1:ITERATIONS
    for i = 1:numel(files);
        for k = 1:numel(REVERSABILITIES)
            realfile = files{i};
            reversability = REVERSABILITIES{k};
            fprintf('Loading links file %s...\n', realfile);
            links = load(realfile);
            %generating result file name prefix
            lastindex = strfind (strtok(realfile, '.'), '/');
            if numel(lastindex) == 0
                lastindex = 0;
            else
                lastindex = lastindex(end);
            end            
            
            [num_nodes, ~, avg_degree, ~] = graphMeasurements(links);
            fname = 'graph_asymptotic_temp.txt';
            generateErdosRenyiGraphSNAP(num_nodes, avg_degree, fname);
            links = importdata(fname);
            bilinks = createBiGraph(links.data);
            m = size(bilinks, 1) / 2; elitesize = round(m ^ .5);
            result = majorityVoteSim3(bilinks, ELITE_POWERS, 1, elitesize, ROUNDS, reversability);
            resultsfilename = strcat(substring(strtok(realfile, '.'), lastindex),...
                '-' ,num2str(ROUNDS), '-rounds', '-m^.5-', reversability,...
                '-erdos-results', datestr(now,'-SSFFF'));
            fprintf('Writing results to file %s...\n', strcat(resultsfilename, '.txt'));
            dlmwrite(strcat(resultsfilename, '.txt'), result, 'delimiter', ',', 'precision', '%i');
            
            generateBarabasiAlbertGraphSNAP(num_nodes, avg_degree, fname);
            links = importdata(fname);
            bilinks = createBiGraph(links.data);
            m = size(bilinks, 1) / 2; elitesize = round(m ^ .5);
            result = majorityVoteSim3(bilinks, ELITE_POWERS, 1, elitesize, ROUNDS, reversability);
            resultsfilename = strcat(substring(strtok(realfile, '.'), lastindex),...
                '-' ,num2str(ROUNDS), '-rounds', '-m^.5-', reversability,...
                '-barabasi-results', datestr(now,'-SSFFF'));
            fprintf('Writing results to file %s...\n', strcat(resultsfilename, '.txt'));
            dlmwrite(strcat(resultsfilename, '.txt'), result, 'delimiter', ',', 'precision', '%i');
        end
    end
end