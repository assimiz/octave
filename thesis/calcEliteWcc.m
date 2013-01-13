function elite_wcc = calcEliteWcc(links, elitesize)
%make links consecutive and ordered according to incoming degree.
links = fixLinks(links);
elite_wcc = links;

for i = 1:size(links, 1)
	src = links(i, 1);
	dst = links(i, 2);
	if src > elitesize && dst > elitesize
		elite_wcc(i, :) = [0, 0];
	end
end
elite_wcc(all(elite_wcc == 0, 2),:)=[];
