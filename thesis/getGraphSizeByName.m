function [ size ] = getGraphSizeByName( filename )

if strfind(lower(filename), 'facebook')
    size = 63731;
elseif strfind(lower(filename), 'twitter')
    size = 81306;
elseif strfind(lower(filename), 'youtube')
    size = 1138499;
elseif strfind(lower(filename), 'slashdot')
    size = 82168;
elseif strfind(lower(filename), 'epinions')
    size = 75879;
elseif strfind(lower(filename), 'flickr')
    size = 197049;
elseif strfind(lower(filename), 'email')
    size = 265214;
elseif strfind(lower(filename), 'cit-hepph')
    size = 34546;
elseif strfind(lower(filename), 'brightkite')
    size = 58228;
elseif strfind(lower(filename), 'gowalla')
    size = 196591;
elseif strfind(lower(filename), 'wikitalk')
    size = 2394385;
elseif strfind(lower(filename), 'dutch')
    size = 4747;
elseif strfind(lower(filename), 'pgp')
    size = 10680;
elseif strfind(lower(filename), 'jazz')
    size = 198;
elseif strfind(lower(filename), 'polblogs')
    size = 1273;
end

end

