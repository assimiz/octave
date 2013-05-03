function [ title ] = getGraphTitleByName( filename )

if strfind(lower(filename), 'facebook')
    title = 'Facebook';
elseif strfind(lower(filename), 'twitter')
    title = 'Twitter';
elseif strfind(lower(filename), 'youtube')
    title = 'Youtube';
elseif strfind(lower(filename), 'slashdot')
    title = 'Slashdot';
elseif strfind(lower(filename), 'epinions')
    title = 'Epinions';
elseif strfind(lower(filename), 'flickr')
    title = 'Flickr';
elseif strfind(lower(filename), 'email')
    title = 'Email';
elseif strfind(lower(filename), 'cit-hepph')
    title = 'Citations';
elseif strfind(lower(filename), 'brightkite')
    title = 'Brightkite';
elseif strfind(lower(filename), 'gowalla')
    title = 'Gowalla';
elseif strfind(lower(filename), 'wikitalk')
    title = 'Wikitalk';
elseif strfind(lower(filename), 'dutch')
    title = 'Dutch Admin';
elseif strfind(lower(filename), 'pgp')
    title = 'PGP Users';
elseif strfind(lower(filename), 'jazz')
    title = 'Jazz Bands';
elseif strfind(lower(filename), 'polblogs')
    title = 'Political Blogs';
end

end

