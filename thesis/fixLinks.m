%fixes links matrix to be contain consecutive node IDs and
%so that nodes ids are according to their incoming rank in
%ascending order (means, the node with highest in-rank is getting
%id = 1 and so on.
function links = fixLinks(links)

fprintf('Computing new links (removing gaps in node ids)...\n');
links = consecutive(links);
fprintf('Computing nodes...\n');
nodes = computeNodes2(links);

fprintf('Computing new links (according to priority)...\n');
links(:, 1) = nodes(:, 1)(links(:, 1));
links(:, 2) = nodes(:, 1)(links(:, 2));