%testing
% clear ; close all; clc
fprintf('testing consecutive...\n');
A = [
      1      4     10     10      4      7     99      1      7     30;
     99     21      7     10     45   1287      1      1      2     30;
]
B = consecutive(A)
expected_B = [
    1    3    5    5    3    6    2    1    6   10;
    2    4    6    5    7    8    1    1    9   10;
]
if B == expected_B
	fprintf('PASS\n');
else
	fprintf('FAIL\n');
end
fprintf('testing computeNodes...\n');
test_links = [1 2; 1 3; 10 11; 2 3; 5 3; 5 2];
unique_nodes = unique(test_links);
new_links = changem(test_links,[1:size(unique_nodes, 1)], unique_nodes)
real_nodes = computeNodes2(new_links)
expected_real_nodes = [
    4    2    0;
    2    1    2;
    1    0    3;
    5    2    0;
    6    1    0;
    3    0    1;
]
if real_nodes == expected_real_nodes
	fprintf('PASS\n');
else
	fprintf('FAIL\n');
end
% fprintf('testing computeLinks...\n');
% new_links = computeLinks(test_links, test_nodes(:, 1));
% expected_new_links = [4 2; 4 1; 11 3; 2 1; 6 1; 6 2];
% if new_links == expected_new_links
	% fprintf('PASS\n');
% else
	% fprintf('FAIL\n');
% end

fprintf('testing playVotingGame and majorityVoteSim...\n');
result = majorityVoteSim(test_links)
expected_result = [
	4 1 1;
	2 0 4;
	0 1 5;
	0 1 5;
	0 0 6;
	0 0 6;
]

if result(:, 2:4) == expected_result
	fprintf('PASS\n');
else
	fprintf('FAIL\n');
end

fprintf('Plotting...\n');
%plotting
figure;
title ("test plot");
area(result(:, 2:4));
xlabel ("elite size");
ylabel ("votes");
legend ("blue: dislike\ngreen: neutral\nred: like", "location", "eastoutside");
legend("boxon");


fprintf('testing main...\n');
files = ['facebook-links-test.txt'];

for i = 1:size(files, 1)
	fprintf('Loading links file %s...\n', files(i, :));
	links = load(files(i, :));
	result = majorityVoteSim(links);
	fprintf('Plotting...\n');
	% plotting
	figure;
	area(result(:, 2:4));
	title (files(i));
	xlabel ("elite size(%)");
	ylabel ("votes");
	legend ("blue: dislike\ngreen: neutral\nred: like", "location", "eastoutside");
	legend("boxon");
end