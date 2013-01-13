% %runs the majority vote simulation
% clear all; close all; clc
% %
% 
% %SIMULATION #3
% 
% linksfile = 'links/bi-barabasi_albert_facebook_like.txt';
% graphname = 'Flickr';
% 
% lastindex = strfind (strtok(linksfile, '.'), '/');
% lastindex = lastindex(end);
% 
% fprintf('Loading links file %s...\n', linksfile);
% links = load(linksfile);
% 
% num_nodes = numel(unique(links));
% elitepower = [1 2 4 8 16 32 64 128 256 512 1024 2048];
% m = size(links, 1) / 2; e = round(m ^ .5); elitesize = e;
% commonpower = 1;
% axismode = 'x-log-y-linear';
% 
% for rounds = (16)
% 	resultsfilename = strcat(substring(strtok(linksfile, '.'), lastindex),...
% 	'-', axismode, '-' ,num2str(rounds), '-rounds', '-m^.5-no_monopoly','-results');
% 	result = majorityVoteSim3(links, resultsfilename, axismode, elitepower, commonpower, elitesize, rounds, graphname)
% end
% 
% fprintf('Writing results to file %s...\n', strcat(resultsfilename, '.txt'));
% csvwrite ( strcat(resultsfilename, '.txt'), result);
% 
% 
% 
% linksfile = 'links/bi-twitter.txt';
% graphname = 'Flickr';
% 
% lastindex = strfind (strtok(linksfile, '.'), '/');
% lastindex = lastindex(end);
% 
% fprintf('Loading links file %s...\n', linksfile);
% links = load(linksfile);
% 
% num_nodes = numel(unique(links));
% elitepower = [1 2 4 8 16 32 64 128 256 512 1024 2048];
% m = size(links, 1) / 2; e = round(m ^ .5); elitesize = e;
% commonpower = 1;
% axismode = 'x-log-y-linear';
% 
% for rounds = (64)
% 	resultsfilename = strcat(substring(strtok(linksfile, '.'), lastindex),...
% 	'-', axismode, '-' ,num2str(rounds), '-rounds', '-m^.5-no_monopoly','-results');
% 	result = majorityVoteSim3(links, resultsfilename, axismode, elitepower, commonpower, elitesize, rounds, graphname)
% end
% 
% fprintf('Writing results to file %s...\n', strcat(resultsfilename, '.txt'));
% csvwrite ( strcat(resultsfilename, '.txt'), result);
% 
% 
% 
% linksfile = 'links/bi-release-youtube-links.txt';
% graphname = 'Flickr';
% 
% lastindex = strfind (strtok(linksfile, '.'), '/');
% lastindex = lastindex(end);
% 
% fprintf('Loading links file %s...\n', linksfile);
% links = load(linksfile);
% 
% num_nodes = numel(unique(links));
% elitepower = [1 2 4 8 16 32 64 128 256 512 1024 2048];
% m = size(links, 1) / 2; e = round(m ^ .5); elitesize = e;
% commonpower = 1;
% axismode = 'x-log-y-linear';
% 
% for rounds = (64)
% 	resultsfilename = strcat(substring(strtok(linksfile, '.'), lastindex),...
% 	'-', axismode, '-' ,num2str(rounds), '-rounds', '-m^.5-no_monopoly','-results');
% 	result = majorityVoteSim3(links, resultsfilename, axismode, elitepower, commonpower, elitesize, rounds, graphname)
% end
% 
% fprintf('Writing results to file %s...\n', strcat(resultsfilename, '.txt'));
% csvwrite ( strcat(resultsfilename, '.txt'), result);
% 
% 
% 
% linksfile = 'links/bi-release-flickr-links.txt';
% graphname = 'Flickr';
% 
% lastindex = strfind (strtok(linksfile, '.'), '/');
% lastindex = lastindex(end);
% 
% fprintf('Loading links file %s...\n', linksfile);
% links = load(linksfile);
% 
% num_nodes = numel(unique(links));
% elitepower = [1 2 4 8 16 32 64 128 256 512 1024 2048];
% m = size(links, 1) / 2; e = round(m ^ .5); elitesize = e;
% commonpower = 1;
% axismode = 'x-log-y-linear';
% 
% for rounds = (16)
% 	resultsfilename = strcat(substring(strtok(linksfile, '.'), lastindex),...
% 	'-', axismode, '-' ,num2str(rounds), '-rounds', '-m^.5-no_monopoly','-results');
% 	result = majorityVoteSim3(links, resultsfilename, axismode, elitepower, commonpower, elitesize, rounds, graphname)
% end
% 
% fprintf('Writing results to file %s...\n', strcat(resultsfilename, '.txt'));
% csvwrite ( strcat(resultsfilename, '.txt'), result);
% 
% 
% 
% linksfile = 'links/bi-Slashdot0902.txt';
% graphname = 'Flickr';
% 
% lastindex = strfind (strtok(linksfile, '.'), '/');
% lastindex = lastindex(end);
% 
% fprintf('Loading links file %s...\n', linksfile);
% links = load(linksfile);
% 
% num_nodes = numel(unique(links));
% elitepower = [1 2 4 8 16 32 64 128 256 512 1024 2048];
% m = size(links, 1) / 2; e = round(m ^ .5); elitesize = e;
% commonpower = 1;
% axismode = 'x-log-y-linear';
% 
% for rounds = (16)
% 	resultsfilename = strcat(substring(strtok(linksfile, '.'), lastindex),...
% 	'-', axismode, '-' ,num2str(rounds), '-rounds', '-m^.5-no_monopoly','-results');
% 	result = majorityVoteSim3(links, resultsfilename, axismode, elitepower, commonpower, elitesize, rounds, graphname)
% end
% 
% fprintf('Writing results to file %s...\n', strcat(resultsfilename, '.txt'));
% csvwrite ( strcat(resultsfilename, '.txt'), result);
% 
% 
% 
% linksfile = 'links/bi-soc-Epinions1.txt';
% graphname = 'Flickr';
% 
% lastindex = strfind (strtok(linksfile, '.'), '/');
% lastindex = lastindex(end);
% 
% fprintf('Loading links file %s...\n', linksfile);
% links = load(linksfile);
% 
% num_nodes = numel(unique(links));
% elitepower = [1 2 4 8 16 32 64 128 256 512 1024 2048];
% m = size(links, 1) / 2; e = round(m ^ .5); elitesize = e;
% commonpower = 1;
% axismode = 'x-log-y-linear';
% 
% for rounds = (16)
% 	resultsfilename = strcat(substring(strtok(linksfile, '.'), lastindex),...
% 	'-', axismode, '-' ,num2str(rounds), '-rounds', '-m^.5-no_monopoly','-results');
% 	result = majorityVoteSim3(links, resultsfilename, axismode, elitepower, commonpower, elitesize, rounds, graphname)
% end
% 
% fprintf('Writing results to file %s...\n', strcat(resultsfilename, '.txt'));
% csvwrite ( strcat(resultsfilename, '.txt'), result);
% 
% 
% 
% linksfile = 'links/bi-facebook-links.txt';
% graphname = 'Flickr';
% 
% lastindex = strfind (strtok(linksfile, '.'), '/');
% lastindex = lastindex(end);
% 
% fprintf('Loading links file %s...\n', linksfile);
% links = load(linksfile);
% 
% num_nodes = numel(unique(links));
% elitepower = [1 2 4 8 16 32 64 128 256 512 1024 2048];
% m = size(links, 1) / 2; e = round(m ^ .5); elitesize = e;
% commonpower = 1;
% axismode = 'x-log-y-linear';
% 
% for rounds = (64)
% 	resultsfilename = strcat(substring(strtok(linksfile, '.'), lastindex),...
% 	'-', axismode, '-' ,num2str(rounds), '-rounds', '-m^.5-no_monopoly','-results');
% 	result = majorityVoteSim3(links, resultsfilename, axismode, elitepower, commonpower, elitesize, rounds, graphname)
% end
% 
% fprintf('Writing results to file %s...\n', strcat(resultsfilename, '.txt'));
% csvwrite ( strcat(resultsfilename, '.txt'), result);



linksfile = 'links/bi-erdos_renyi_facebook_like.txt';
graphname = 'Erdos-Renyi';

lastindex = strfind (strtok(linksfile, '.'), '/');
lastindex = lastindex(end);

fprintf('Loading links file %s...\n', linksfile);
links = load(linksfile);

num_nodes = numel(unique(links));
elitepower = [1 2 4 8 16 32 64 128 256 512 1024 2048];
m = size(links, 1) / 2; e = round(m ^ .5); elitesize = e;
commonpower = 1;
axismode = 'x-log-y-linear';

for rounds = (63)
	resultsfilename = strcat(substring(strtok(linksfile, '.'), lastindex),...
	'-', axismode, '-' ,num2str(rounds), '-rounds', '-m^.5','-results');
	result = majorityVoteSim3(links, resultsfilename, axismode, elitepower, commonpower, elitesize, rounds, graphname)
end

fprintf('Writing results to file %s...\n', strcat(resultsfilename, '.txt'));
csvwrite ( strcat(resultsfilename, '.txt'), result);


