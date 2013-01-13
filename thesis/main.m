%runs the majority vote simulation
clear all; close all; clc
% 
% linksfile = 'links/bi-barabasi_albert_facebook_like.txt';
% graphname = 'Barabasi-Albert';
linksfile = 'links/bi-erdos_renyi_facebook_like.txt';
graphname = 'Erdos-Renyi';
% linksfile = 'links/bi-twitter.txt';
% graphname = 'Twitter';
% linksfile = 'links/bi-release-youtube-links.txt';
% graphname = 'Youtube';
% linksfile = 'links/bi-release-flickr-links.txt';
% graphname = 'Flickr';
% linksfile = 'links/bi-Slashdot0902.txt';
% graphname = 'Slashdot';
% linksfile = 'links/bi-soc-Epinions1.txt';
% graphname = 'Epinions';
% linksfile = 'links/bi-facebook-links.txt';
% graphname = 'Facebook';

lastindex = strfind (strtok(linksfile, '.'), '/');
lastindex = lastindex(end);

fprintf('Loading links file %s...\n', linksfile);
links = load(linksfile);

%SIMULATION #1
% axismode = 'linear';
% for elitepower = 1:1:5
	% resultsfilename = strcat(substring(strtok(linksfile, '.'), lastindex),...
	% '-elite-', num2str(elitepower), '-common', num2str(commonpower), '-', axismode, '-results');
	% majorityVoteSim(links, resultsfilename, axismode, 100, elitepower, commonpower, rounds, graphname);
% end

% axismode = 'log';
% for elitepower = 1:1:5
	% resultsfilename = strcat(substring(strtok(linksfile, '.'), lastindex),...
	% '-elite-', num2str(elitepower), '-common', num2str(commonpower), '-', axismode, '-results');
	% majorityVoteSim(links, resultsfilename, axismode, 100, elitepower, commonpower, rounds, graphname);
% end

%SIMULATION #2
% elitepower = [1 2 4 8 16 32 64 128 256 512 1024 2048];
% commonpower = 1;
% axismode = 'x-log-y-linear';
% for rounds = [1 2 4 8 16 32 64 128]
% 	resultsfilename = strcat(substring(strtok(linksfile, '.'), lastindex),...
% 	'-elite-m^0.5-', axismode, '-' ,num2str(rounds), '-rounds', '','-results');
% 	majorityVoteSim2(links, resultsfilename, axismode, elitepower, commonpower, rounds, graphname);
% end

%SIMULATION #3
num_nodes = numel(unique(links));
elitepower = [1 2 4 8 16 32 64 128 256 512 1024 2048];
elitesize = unique(round(num_nodes.^(0.1:0.1:1.0)));
commonpower = 1;
axismode = 'x-log-y-linear';

for rounds = (63)
	resultsfilename = strcat(substring(strtok(linksfile, '.'), lastindex),...
	'-', axismode, '-' ,num2str(rounds), '-rounds', '','-results');
	result = majorityVoteSim3(links, resultsfilename, axismode, elitepower, commonpower, elitesize, rounds, graphname)
end

fprintf('Writing results to file %s...\n', strcat(resultsfilename, '.txt'));
csvwrite ( strcat(resultsfilename, '.txt'), result);


