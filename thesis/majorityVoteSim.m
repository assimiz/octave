function result = majorityVoteSim(file)

results_file = strcat("results-", file);

fprintf('Loading links file %s...\n', file);
links = load(file);
fprintf('Fixing links...\n');
links = fixLinks(links);
fprintf('Running the majority vote simulation...\n');
result = playVotingGame(links);
fprintf('Writing results to file %s...\n', results_file);
csvwrite (results_file, result);
fprintf('Plotting...\n');
figure;
hold on;
proc_result = processResults(result);
area(proc_result(:, 1), proc_result(:, 3:5));
plot(proc_result(:, 1), proc_result(:, 2), 'LineWidth', 2, "Color", "w");
title (file);
xlabel ("elite size(n^x)");
ylabel ("votes");
legend ("blue: dislike\ngreen: neutral\nred: like", "location", "eastoutside");
legend("boxon");