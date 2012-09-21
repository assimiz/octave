%creates bidirectional graph file from unidirectional.
%each row in the bidirectional graph fiule still represnt
%a unidirectional edge but it is assured that it will have
%a UNIQUE entries [x y] and [y x] for every [x y] entry in the
%unidirectional file. For example, the following unidirectional
%graph:
%uni = [1	2
%		1	3
%		2	1
%		3	1
%		3	2
%		4	3]
%... will create the following bidirectional graph:
%bi = [	1	2
%		1	3
%		2	1
%		2	3
%		3	1
%		3	2
%		3	4
%		4	3]
%
function createBiGraphFile(filename)
links = load(filename);
links = [links; [links(:, 2), links(:, 1)]];
links = unique(links, 'rows');
links = sortrows(links, [1 2]);
dlmwrite(strcat('bi-', filename), links, '\t');
