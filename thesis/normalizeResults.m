function norm_results = normalizeResults(conncompsize, result)
%elite size remains as is
norm_results(:, 1) = result(:, 1);
%like voters are normalized to connected component size
norm_results(:, 3) = min(result(:, 4), conncompsize);
%dislike and neutral voters are normalized to connected component size
norm_results(:, 2) = conncompsize - norm_results(:, 3);
% norm_results(:, 3) = 0;
norm_results = norm_results(1:find(norm_results(:, 1) >= conncompsize, 1, 'first'), :);
