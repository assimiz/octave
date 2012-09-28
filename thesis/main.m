%runs the majority vote simulation
clear ; close all; clc

mkdir('results');
mkdir('links');

% file = "links/bi-release-youtube-links.txt";
file = "links/bi-facebook-links.txt";

% majorityVoteSim(file, 'linear', 100, 1);
% majorityVoteSim(file, 'linear', 100, 5);

for elite_vote = 1:1:5
	majorityVoteSim(file, 'log', 100, elite_vote);
end
