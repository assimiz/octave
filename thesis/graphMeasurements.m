function [n m d e] = graphMeasurements(links)
n = size(unique(links), 1);
m = size(links, 1) / 2;
d = round(m * 2 / n);
e = round(m ^ .5);
