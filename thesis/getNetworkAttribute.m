function value = getNetworkAttribute(network, attr)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
fileID = fopen('networks.txt');
C = textscan(fileID, '%s %d %d %d %d %d %d');
fclose(fileID);
for i=1:length(C{1})
    if strcmpi(network, C{1}{i})
        if strcmpi(attr, 'NumNodes')
            value = double(C{2}(i));
        elseif strcmpi(attr, 'NumEdges')
            value = double(C{3}(i));
        elseif strcmpi(attr, 'AvgDegree')
            value = double(C{4}(i));
        elseif strcmpi(attr, 'EliteSize')
            value = double(C{5}(i));
        elseif strcmpi(attr, 'MinDegree')
            value = double(C{6}(i));
        elseif strcmpi(attr, 'MaxDegree')
            value = double(C{7}(i));
        end
        break;
    end
end