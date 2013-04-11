%runs unit testing.
clear all; 
close all; clc
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
	fprintf('PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS\n\n');
else
	beep
	fprintf('FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL\n\n');
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
	fprintf('PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS\n\n');
else
	beep
	fprintf('FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL\n\n');
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
	fprintf('PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS\n\n');
else
	beep
	fprintf('FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL\n\n');
end

fprintf('testing playVotingGame...\n');
links = fixLinks(test_links);
num_nodes = numel(unique(links));
result = playVotingGame(links, [1:1:num_nodes], num_nodes, 1, 1, 1)
expected_result = [
	4 1 1;
	2 0 4;
	0 1 5;
	0 1 5;
	0 0 6;
	0 0 6;
]

if result(:, 2:4) == expected_result
	fprintf('PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS\n\n');
else
	beep
	fprintf('FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL\n\n');
end

fprintf('Plotting...\n');
%plotting
figure;
title ('test plot');
area(result(:, 4:-1:2));
xlabel ('elite size');
ylabel ('votes');
legend ('like', 'neutral', 'dislike', 'location', 'eastoutside');
legend('boxon');


fprintf('testing majorityVoteSim...\n');

linksfile = 'links/links-test-2.txt';
lastindex = findstr (strtok(linksfile, '.'), '/');
lastindex = lastindex(end);
elitepower = 2;
commonpower = 1;
axismode = 'linear';
resultsfilename = strcat(substring(strtok(linksfile, '.'), lastindex),...
	'-elite-', num2str(elitepower), '-common', num2str(commonpower), '-', axismode, '-results');
fprintf('Loading links file %s...\n', linksfile);
links = load(linksfile);
result = majorityVoteSim(links, resultsfilename, axismode, 6, elitepower, commonpower, 1, linksfile)
expected_result = [
   1   2   2   2
   2   2   0   4
   3   0   0   6
   4   0   0   6
   5   0   0   6
   6   0   0   6
]

if result == expected_result
	fprintf('PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS\n\n');
else
	beep
	fprintf('FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL\n\n');
end

linksfile = 'links/facebook-links-test.txt';
lastindex = findstr (strtok(linksfile, '.'), '/');
lastindex = lastindex(end);
elitepower = 1;
commonpower = 1;
axismode = 'linear';
resultsfilename = strcat(substring(strtok(linksfile, '.'), lastindex),...
	'-elite-', num2str(elitepower), '-common', num2str(commonpower), '-', axismode, '-results');
fprintf('Loading links file %s...\n', linksfile);
links = load(linksfile);
result = majorityVoteSim(links, resultsfilename, axismode, 100, elitepower, commonpower, 1, linksfile);

linksfile = 'links/bi-links-test.txt';
lastindex = findstr (strtok(linksfile, '.'), '/');
lastindex = lastindex(end);
elitepower = 3;
commonpower = 1;
axismode = 'log';
resultsfilename = strcat(substring(strtok(linksfile, '.'), lastindex),...
	'-elite-', num2str(elitepower), '-common', num2str(commonpower), '-', axismode, '-results');
fprintf('Loading links file %s...\n', linksfile);
links = load(linksfile);
result = majorityVoteSim(links, resultsfilename, axismode, 100, elitepower, commonpower, 1, linksfile);


fprintf('testing createBiGraph...Line graph\n');

links = [1 2; 2 3; 3 4; 4 5; 5 6; 6 7];
result = createBiGraph(links);
expected_result = [ 
     1     2
     2     1
     2     3
     3     2
     3     4
     4     3
     4     5
     5     4
     5     6
     6     5
     6     7
     7     6
	 ];

if result == expected_result
	fprintf('PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS\n\n');
else
	beep
	fprintf('FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL\n\n');
end	 

fprintf('testing majorityVoteSim2...Line graph\n');

links = result;
graphname = 'Line (size=7)';
elitepower = [1 2 4 8];
commonpower = 1;
axismode = 'x-log-y-linear';
result = [];

for rounds = [1 2 4 8]
	resultsfilename = strcat(graphname,...
	'-elite-m^0.5-', axismode, '-' ,num2str(rounds), '-rounds', '', '-results');
	result = [result; majorityVoteSim2(links, resultsfilename, axismode, elitepower, commonpower, rounds, 'elite-non-revertive', graphname)];
end

expected_result = [
     1     1     4     1     2
     2     1     3     1     3
     4     1     3     0     4
     8     1     3     0     4
     1     1     4     0     3
     2     1     3     0     4
     4     1     3     0     4
     8     1     3     0     4
     1     1     4     0     3
     2     1     3     0     4
     4     1     3     0     4
     8     1     3     0     4
     1     1     4     0     3
     2     1     3     0     4
     4     1     3     0     4
     8     1     3     0     4
];

if result == expected_result
	fprintf('PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS\n\n');
else
	beep
	fprintf('FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL\n\n');
end	 



fprintf('testing createCompleteGraph...\n');
result = createCompleteGraph(5);
expected_result = [ 
     1     2
     1     3
     1     4
     1     5
     2     1
     2     3
     2     4
     2     5
     3     1
     3     2
     3     4
     3     5
     4     1
     4     2
     4     3
     4     5
     5     1
     5     2
     5     3
     5     4
	 ];

if result == expected_result
	fprintf('PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS\n\n');
else
	beep
	fprintf('FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL\n\n');
end	 

fprintf('testing majorityVoteSim2...Mesh graph\n');

links = createCompleteGraph(100);
links = createBiGraph(links);
graphname = 'Mesh (size=100)';
elitepower = [1 2 4 8];
commonpower = 1;
axismode = 'x-log-y-linear';
result = [];

for rounds = [1 2 4 8]
	resultsfilename = strcat(graphname,...
	'-elite-m^0.5-', axismode, '-' ,num2str(rounds), '-rounds', '', '-results');
	result = [result; majorityVoteSim2(links, resultsfilename, axismode, elitepower, commonpower, rounds, 'elite-non-revertive', graphname)];
end

expected_result = [
     1     1     0     0   100
     2     1     0     0   100
     4     1     0     0   100
     8     1     0     0   100
     1     1     0     0   100
     2     1     0     0   100
     4     1     0     0   100
     8     1     0     0   100
     1     1     0     0   100
     2     1     0     0   100
     4     1     0     0   100
     8     1     0     0   100
     1     1     0     0   100
     2     1     0     0   100
     4     1     0     0   100
     8     1     0     0   100
];

if result == expected_result
	fprintf('PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS\n\n');
else
	beep
	fprintf('FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL\n\n');
end	 

linksfile = 'links/non-reverse-test.txt';
links = load(linksfile);
elitesize = 2;
numnodes = 5;
elitepower = 1;
commonpower = 1;

reversability = 'non-revertive';
rounds = 1;
result = playVotingGame(links, elitesize, numnodes, elitepower, commonpower, rounds, reversability)
expected_result = [2 0 0 5];
if result == expected_result
	fprintf('PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS\n\n');
else
	beep
	fprintf('FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL\n\n');
end


reversability = 'revertive';
rounds = 1;
result = playVotingGame(links, elitesize, numnodes, elitepower, commonpower, rounds, reversability)
expected_result = [2 2 0 3];
if result == expected_result
	fprintf('PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS\n\n');
else
	beep
	fprintf('FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL\n\n');
end
rounds = 2;
result = playVotingGame(links, elitesize, numnodes, elitepower, commonpower, rounds, reversability)
expected_result = [2 3 0 2];
if result == expected_result
	fprintf('PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS\n\n');
else
	beep
	fprintf('FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL\n\n');
end
rounds = 3;
result = playVotingGame(links, elitesize, numnodes, elitepower, commonpower, rounds, reversability)
expected_result = [2 2 0 3];
if result == expected_result
	fprintf('PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS\n\n');
else
	beep
	fprintf('FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL\n\n');
end


reversability = 'elite-non-revertive';
rounds = 1;
result = playVotingGame(links, elitesize, numnodes, elitepower, commonpower, rounds, reversability)
expected_result = [2 0 0 5];
if result == expected_result
	fprintf('PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS PASS\n\n');
else
	beep
	fprintf('FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL FAIL\n\n');
end



	 
