function [] = generateErdosRenyiGraphSNAP( nodes, avgdegree, fname )
%Gnerates random graph using SNAP package (requires graphgen.exe in current
%folder.
%   nodes: number of nodes
%   degree: degree of each new node
%   fname: file name to save the graph

 system(sprintf('"graphgen.exe" -g:e -n:%d -m:%d -o:%s', nodes, avgdegree * nodes, fname));
end