function [n, m, d_avg, e, d_min, d_max] = extendedGraphMeasurements(bilinks)
n = size(unique(bilinks), 1);
m = size(bilinks, 1) / 2;
d_avg = m / n;
e = m ^ .5;
degrees = sum(histc(bilinks,1:max(max(bilinks))), 2) / 2;
d_min = min(degrees);
d_max = max(degrees);
