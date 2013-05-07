function [ reversible_filenames, elite_non_reversible_filenames ] = getFilesFromFolder( folder, network )
%getFilesFromFolder returns files for the specified network from folder

files = getAllFiles(folder);
j = 1;
k = 1;
reversible_filenames = {};
elite_non_reversible_filenames = {};
for i = 1:numel(files)
    filename = files{i};
    if ~isempty(strfind(filename, 'rounds-no_monopoly')) ||... 
        ~isempty(strfind(filename, 'rounds-revertive')) ||...
        ~isempty(strfind(filename, 'power-revertive')) ||...
        ~isempty(strfind(filename, 'powerrevertive')) ||...
        ~isempty(strfind(filename, 'rounds-m^.5-no_monopoly')) ||... 
        ~isempty(strfind(filename, 'rounds-m^.5-revertive')) ||...
        ~isempty(strfind(filename, 'rounds-binary_search-revertive'))
        
        if strfind(lower(filename), network)
            reversible_filenames{j} = filename;
            j = j+1;
        end
    elseif ~isempty(strfind(filename, 'rounds-elite-non-revertive')) ||...         
        ~isempty(strfind(filename, 'rounds-results')) ||...
        ~isempty(strfind(filename, 'power-elite-non-revertive')) ||... 
        ~isempty(strfind(filename, 'powerelite-non-revertive')) ||... 
        ~isempty(strfind(filename, 'rounds-m^.5-elite-non-revertive')) ||... 
        ~isempty(strfind(filename, 'rounds-m^.5-results')) ||...
        ~isempty(strfind(filename, 'rounds-binary_search-elite-non-revertive'))
        
        if strfind(lower(filename), network)
            elite_non_reversible_filenames{k} = filename;
            k = k+1;
        end
    end
end

if length(reversible_filenames) == 1 && length(elite_non_reversible_filenames) == 1
    reversible_filenames = reversible_filenames{1};
    elite_non_reversible_filenames = elite_non_reversible_filenames{1};
end

end

