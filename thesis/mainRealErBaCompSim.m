% clear all; 
close all;
%clc
    
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
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-WikiTalk.txt';    
    'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-release-flickr-links.txt';    
    };

ITERATIONS = 1;

for j = 1:ITERATIONS
    for i = 1:numel(files);
        realfile = files{i};
        fprintf('Loading links file %s...\n', realfile);
        links = load(realfile);
        %generating result file name prefix
        lastindex = strfind (strtok(realfile, '.'), '/');
        if numel(lastindex) == 0
            lastindex = 0;
        else
            lastindex = lastindex(end);
        end
        resultsfilprefix = substring(strtok(realfile, '.'), lastindex);
        
        [num_nodes, ~, avg_degree, ~] = graphMeasurements(links);
        fname = 'graph_asymptotic_temp.txt';
        generateErdosRenyiGraphSNAP(num_nodes, avg_degree, fname);
        links = importdata(fname);
        bilinks = createBiGraph(links.data);
        majorityVoteBinarySearchElitePower(bilinks, strcat(resultsfilprefix, '_erdos'), 1);
        majorityVoteBinarySearch(bilinks, strcat(resultsfilprefix, '_erdos'), 1);
        
        generateBarabasiAlbertGraphSNAP(num_nodes, avg_degree, fname);
        links = importdata(fname);
        bilinks = createBiGraph(links.data);
        majorityVoteBinarySearchElitePower(bilinks, strcat(resultsfilprefix, '_barabasi'), 1);
        majorityVoteBinarySearch(bilinks, strcat(resultsfilprefix, '_barabasi'), 1);
    end
end
