function result = majorityVoteSim2(links, resultsfilename, axismode, elitepower, commonpower, rounds, reversability, graphname)

fprintf('Fixing links...\n');
links = fixLinks(links);
fprintf('calculating graph measurements...\n');
n = size(unique(links), 1);
m = size(links, 1) / 2;
elite_size = round(m ^ .5);
result = zeros(0, 5);
fprintf('Running the majority vote simulation...\n');
for e = elitepower
	for c = commonpower
		temp = playVotingGame(links, elite_size, n, e, c, rounds, reversability);
		elite_size = temp(1,1);
		dislikes = temp(1,2);
		neutral = temp(1,3);
		likes = temp(1,4);
		result = [result; [e, c, dislikes, neutral, likes]];
	end
end

fprintf('Writing results to file %s...\n', strcat(resultsfilename, '.txt'));
dlmwrite(strcat(resultsfilename, '.txt'), result, 'delimiter', ',', 'precision', '%i');

title = sprintf('Majority vote with elite monopoly.\n%s.\n%d Round(s).', graphname, rounds);
processResults2(result,  strcat(resultsfilename, '.pdf'), graphname, axismode, n, m);