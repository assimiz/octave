%runs unit testing.
clear ; close all; clc
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
	fprintf('PASS PASS PASS PASS PASS PASS PASS\n\n');
else
	fprintf('FAIL FAIL FAIL FAIL FAIL FAIL FAIL\n\n');
end
fprintf('testing computeNodes...\n');
test_links = [1 2; 1 3; 10 11; 2 3; 5 3; 5 2];
consecutive_links = consecutive(test_links)
real_nodes = computeNodes2(consecutive_links)
expected_real_nodes = [    
  4   2   0;
  5   1   0;
  2   1   2;
  6   2   0;
  1   0   3;
  3   0   1;
]
if real_nodes == expected_real_nodes
	fprintf('PASS PASS PASS PASS PASS PASS PASS\n\n');
else
	fprintf('FAIL FAIL FAIL FAIL FAIL FAIL FAIL\n\n');
end

fprintf('testing fixLinks...\n');
real_links = fixLinks(test_links)
expected_real_links = [
   4   2;
   4   1;
   5   3;
   2   1;
   6   1;
   6   2;
]

if real_links == expected_real_links
	fprintf('PASS PASS PASS PASS PASS PASS PASS\n\n');
else
	fprintf('FAIL FAIL FAIL FAIL FAIL FAIL FAIL\n\n');
end

fprintf('testing playVotingGame...\n');
links = fixLinks(test_links);
num_nodes = numel(unique(links));
result = playVotingGame(links, [1:1:num_nodes], num_nodes)
expected_result = [
	4 1 1;
	2 0 4;
	0 1 5;
	0 1 5;
	0 0 6;
	0 0 6;
]

if result(:, 2:4) == expected_result
	fprintf('PASS PASS PASS PASS PASS PASS PASS\n\n');
else
	fprintf('FAIL FAIL FAIL FAIL FAIL FAIL FAIL\n\n');
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


fprintf('testing majorityVoteSim...\n');
file = 'links/facebook-links-test.txt';
result = majorityVoteSim(file, 'linear');

file = 'links/bi-links-test.txt';
result = majorityVoteSim(file, 'log');
