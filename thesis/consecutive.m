function mapout = consecutive(Z)
maxel = max(unique(Z));
map = zeros(maxel, 1) - 1;
mapout = zeros(size(Z));
next = 1;
for i = 1:numel(Z)
	if map(Z(i)) == -1
		map(Z(i)) = next;
		next = next + 1;
	end
	mapout(i) = map(Z(i));
end