clear all; close all; clc

fprintf('Printing graph measurements...\n');

files = {
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-facebook-links.txt';        
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-Slashdot0902.txt';
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-twitter.txt';
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-release-youtube-links.txt';
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-Gowalla_edges.txt';
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-Brightkite_edges.txt';
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-Cit-HepPh.txt';
%     'C:/Users/mizrachi/Documents/GitHub/octave/thesis/links/bi-release-flickr-links.txt';    
%     
%     'links/bi-out.epinions-links.txt'; 
%     'links/bi-out.enron-links.txt'; 
%     'links/bi-out.slashdot-threads-links.txt'; 
    'links/bi-out.wikiconflict-links.txt';};


for i = 1:numel(files);
    linksfile = files{i};
    links = load(linksfile);
    [n m d e e_percentage] = graphMeasurements(links);   
    C{i, :} = [n m d e e_percentage];
end

dlmwrite('measurements.txt', C, 'delimiter', ',', 'precision', '%i');
% fid = fopen('measurements.txt','r+');
% fprintf(fid, 'Name, Nodes, Edges, Links, Avg. Deg., Elite (percentage)');
% fclose(fid);

% dlmwrite('measurements.txt', C, 'delimiter', ',', 'precision', '%i');
% fid = fopen('measurements.txt','r+');
% fprintf(fid, 'Name, Nodes, Edges, Links, Avg. Deg., Elite (percentage)');
% fclose(fid);

% fid = fopen('measurements.txt','r+');
% fgetl(fid);
% for i = 1:numel(files);
%     line = fgetl(fid);
%     linksfile = files{i};
%     network = getGraphTitleByName(linksfile);
%     fprintf(fid, strcat(network, ',', line));
% end
% fclose(fid);