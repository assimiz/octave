function proc_results = processResults(results)

elite_size = results(:, 1);
dislike_voters = results(:, 2);
neutral_voters = results(:, 3);
like_voters = results(:, 4);
total = dislike_voters(1) + neutral_voters(1) + like_voters(1);

proc_results(:, 1) = log10(elite_size) / log10(total);
proc_results(:, 2) = elite_size / total * 100;	
proc_results(:, 3) = dislike_voters / total * 100;
proc_results(:, 4) = neutral_voters / total * 100;
proc_results(:, 5) = like_voters / total * 100;