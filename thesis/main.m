%runs the majority vote simulation
clear ; close all; clc

mkdir('results');
file = "links/bi-release-youtube-links.txt";
result = majorityVoteSim(file, 'log');
