function result = majorityVoteSim(links)
fprintf('Computing new links (removing gaps in node ids)...\n');
links = consecutive(links);
fprintf('Computing nodes...\n');
nodes = computeNodes2(links);

fprintf('Computing new links (according to priority)...\n');
links(:, 1) = nodes(:, 1)(links(:, 1));
links(:, 2) = nodes(:, 1)(links(:, 2));
fprintf('Running the majority vote simulation...\n');
result = playVotingGame(links);