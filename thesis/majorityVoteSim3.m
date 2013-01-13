function result = majorityVoteSim3(links, resultsfilename, axismode, elitepower, commonpower, elitesize, rounds, graphname)

fprintf('Fixing links...\n');
links = fixLinks(links);
fprintf('calculating graph measurements...\n');
n = size(unique(links), 1);
m = size(links, 1) / 2;
result = zeros(0, 5);
fprintf('Running the majority vote simulation...\n');
for e = elitepower
	for c = commonpower
		temp = playVotingGame(links, elitesize, n, e, c, rounds, 'monopoly');
		temp = [ones(size(temp, 1), 1) * e, temp];
		result = [result; temp];
	end
end

%title = sprintf('Majority vote with elite coalition.\n%s.\n%d Round(s).', graphname, rounds);
%processResults2(result,  strcat(resultsfilename, '.png'), title, axismode, n, m);