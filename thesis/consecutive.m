%returns consecutive mapping of values in Z. for example, if 
%Z = [1  2
%	  10 5
%	  5  3]
%the result will be 
%mapout = [1  4
%	  	   2  3
%	  	   3  5]
function mapout = consecutive(Z)
maxel = max(reshape(Z, numel(Z), 1));
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