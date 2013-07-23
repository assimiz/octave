function success = addMaxDegreeToPlot(curve, network, color)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
fileID = fopen('networks.txt');
C = textscan(fileID, '%s %d %d %d %d %d %d');
fclose(fileID);
success = 0;
for i=1:length(C{1})
    if strcmpi(network, C{1}{i})
        max_degree = double(C{7}(i));        
        plotHorizotalIntersectionPoint(curve, max_degree, 's', color);
        avg_degree = double(C{4}(i));        
        plotHorizotalIntersectionPoint(curve, avg_degree, 'd', color);
        break;
    end
end
end

