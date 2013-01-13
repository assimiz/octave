function [n m] = calculateGraphMeasurements(linksfile)
fprintf('Calculating graph measurements for file %s\n', linksfile);
g = load(linksfile);
n = size(unique(g), 1);
m = size(g, 1) / 2;
%writing matrix to file
lastindex = findstr (strtok(linksfile, '.'), '/');
lastindex = lastindex(end);
filename = strcat('./measurements/',substring(strtok(linksfile, '.'), lastindex),	'-measurements.txt');
dlmwrite(filename, [n m]);