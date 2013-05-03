function [ reversible_filenames, elite_non_reversible_filenames ] = getFilesFromFolderByRegExp( folder, expression )
%getFilesFromFolder returns files for the specified network from folder

files = getAllFiles(folder);
j = 1;
k = 1;
for i = 1:numel(files)
    filename = files{i};
    if ~isempty(strfind(filename, 'rounds-no_monopoly')) ||... 
        ~isempty(strfind(filename, 'rounds-revertive')) ||...
        ~isempty(strfind(filename, 'rounds-m^.5-no_monopoly')) ||... 
        ~isempty(strfind(filename, 'rounds-m^.5-revertive')) ||...
        ~isempty(strfind(filename, 'rounds-binary_search-revertive'))
        
        if regexp(lower(filename), expression)
            reversible_filenames{j} = filename;
            j = j+1;
        end
    elseif ~isempty(strfind(filename, 'rounds-elite-non-revertive')) ||... 
        ~isempty(strfind(filename, 'rounds-results')) ||...
        ~isempty(strfind(filename, 'rounds-m^.5-elite-non-revertive')) ||... 
        ~isempty(strfind(filename, 'rounds-m^.5-results')) ||...
        ~isempty(strfind(filename, 'rounds-binary_search-elite-non-revertive'))
        
        if regexp(lower(filename), expression)
            elite_non_reversible_filenames{k} = filename;
            k = k+1;
        end
    end
end

end

function [ output_args ] = Untitled4( input_args )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here


end

