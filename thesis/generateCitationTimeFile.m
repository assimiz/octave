%loading raw file
fid = fopen('./time/cit-HepPh-dates.txt','r');
data = textscan(fid, '%f %s');
fclose(fid);
%getting unique node IDs
result = zeros(length(unique(data{1})), 3);

j = 1;
while j <= length(data{1})
    node = data{1}(j);
    %last index is first check-in index
    time = data{2}(j);
    [year, time] = strtok(time, '-');
    [month, ~] = strtok(time, '-');
    %# cross-listed papers have ids 11<true_id>
    if str2double(substring(num2str(node), 0, 1)) == 11
        node = str2double(substring(num2str(node), 2, length(num2str(node)) - 1));
    end
    result(j, :) = [node str2double(year) str2double(month)];
    j = j + 1;
end

dlmwrite('./time/cit-HepPh_time.txt', result, 'delimiter', ',', 'precision', '%i');