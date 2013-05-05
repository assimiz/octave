%loading raw file
fid = fopen('./time/Brightkite_totalCheckins.txt','r');
data = textscan(fid, '%f %s %f %f %s');
fclose(fid);
%getting unique node IDs
result = zeros(length(unique(data{1})), 3);

i = 1;
j = 1;
while i <= length(data{1})
    node = data{1}(i);
    %last index is first check-in index
    last_index = find(data{1} == node, 1, 'last' );
    time = data{2}(last_index);
    [year, time] = strtok(time, '-');
    [month, ~] = strtok(time, '-');
    result(j, :) = [node str2double(year) str2double(month)];
    i = last_index + 1;
    j = j + 1;
end

dlmwrite('./time/brightkite_time.txt', result, 'delimiter', ',', 'precision', '%i');
