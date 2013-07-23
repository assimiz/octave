function [n m d e e_percentage] = graphMeasurements(links)
n = size(unique(links), 1);
m = size(links, 1) / 2;
d = (m * 2 / n);
e = round(m ^ .5);
e_percentage = (e / n) * 100;
