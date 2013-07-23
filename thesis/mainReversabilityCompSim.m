%runs the reversability comparison majority vote simulation
%clear all;
close all; clc
%

%SIMULATION #3
files = {
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-jazz.txt';    
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-Email-EuAll.txt';
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-DutchElite.txt';
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-polblogs.gml.txt';    
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-PGPgiantcompo.txt';
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-WikiTalk.txt';    
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-soc-Epinions1.txt';

%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-facebook-links.txt';        
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-Slashdot0902.txt';
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-twitter.txt';
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-release-youtube-links.txt';
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-Gowalla_edges.txt';
    'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-Brightkite_edges.txt';
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-Cit-HepPh.txt';
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-release-flickr-links.txt';    
    };

for i = 1:numel(files);
    linksfile = files{i};
    fprintf('Loading links file %s...\n', linksfile);
    links = load(linksfile);
    lastindex = strfind (strtok(linksfile, '.'), '/');
    if numel(lastindex) == 0
        lastindex = 0;
    else
        lastindex = lastindex(end);
    end
    resultsfilprefix = substring(strtok(linksfile, '.'), lastindex);
    majorityVoteBinarySearchElitePower(links, resultsfilprefix, 0);
end