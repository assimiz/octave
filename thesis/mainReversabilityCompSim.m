%runs the reversability comparison majority vote simulation
%clear all;
close all; clc
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
    majorityVoteBinarySearch(links, resultsfilprefix, 0);
end