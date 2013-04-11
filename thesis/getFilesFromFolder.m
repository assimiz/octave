function [ reversible_filename, elite_non_reversible_filename ] = getFilesFromFolder( folder, network )
%getFilesFromFolder returns files for the specified network from folder

files = getAllFiles(folder);
for i = 1:numel(files)
    filename = files{i};
    if ~isempty(strfind(filename, 'rounds-no_monopoly')) ||... 
        ~isempty(strfind(filename, 'rounds-revertive')) ||...
        ~isempty(strfind(filename, 'rounds-m^.5-no_monopoly')) ||... 
        ~isempty(strfind(filename, 'rounds-m^.5-revertive'))
        
        if strfind(lower(filename), network)
            reversible_filename = filename;
        end
    elseif ~isempty(strfind(filename, 'rounds-elite-non-revertive')) ||... 
        ~isempty(strfind(filename, 'rounds-results')) ||...
        ~isempty(strfind(filename, 'rounds-m^.5-elite-non-revertive')) ||... 
        ~isempty(strfind(filename, 'rounds-m^.5-results'))
        
        if strfind(lower(filename), network)
            elite_non_reversible_filename = filename;
        end
    end
end

end

