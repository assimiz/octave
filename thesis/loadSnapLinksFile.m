function links = loadSnapLinksFile( fname )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
fid = fopen(fname);
iRow = 1;
while (~feof(fid))
    tmp = textscan(fid,'%f %f\n','CommentStyle','#');
    if ~isempty(tmp{1})
        links(iRow,:) = [tmp{1} tmp{2}];
    end
    iRow = iRow + 1;
end
fclose(fid);
end

