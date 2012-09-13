%runs the majority vote simulation
clear ; close all; clc

files = ['release-flickr-links.txt';];

for i = 1:size(files, 1)
	fprintf('Loading links file %s...\n', files(i, :));
	links = load(files(i, :));
	result = majorityVoteSim(links);
	fprintf('Plotting...\n');
	%plotting
	figure;
	area(result(:, 2:4));
	title (files(i));
	xlabel ("elite size");
	ylabel ("votes");
	legend ("blue: dislike\ngreen: neutral\nred: like", "location", "eastoutside");
	legend("boxon");
end