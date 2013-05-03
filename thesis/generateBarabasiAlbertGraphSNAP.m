function [] = generateBarabasiAlbertGraphSNAP( nodes, degree, fname )
%Gnerates random graph using SNAP package (requires graphgen.exe in current
%folder.
%   nodes: number of nodes
%   degree: degree of each new node
%   fname: file name to save the graph

 system(sprintf('"graphgen.exe" -g:b -n:%d -k:%d -o:%s', nodes, degree, fname));
end

