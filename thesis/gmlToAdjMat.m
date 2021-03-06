fileName = 'polblogs.gml';
inputfile = fopen(fileName);
A=[];

l=0;
k=1;
while 1

    % Get a line from the input file
    tline = fgetl(inputfile);

    % Quit if end of file
    if ~ischar(tline)
        break
    end
    
    nums = regexp(tline,'\d+','match'); %get number from string
    if ~isempty(nums)
        if l==1
            l=0;
            A(k,2)=str2double(nums{1}); 
            k=k+1;
            continue;
        end
        A(k,1)=str2double(nums{1});
        l=1;
    else
        l=0;
        continue;
    end 
end

dlmwrite(strcat(fileName, '.txt'), A, 'delimiter', '\t', 'precision', '%i');