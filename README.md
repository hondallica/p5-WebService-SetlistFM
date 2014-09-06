# NAME

WebService::SetlistFM - A simple and fast interface to the www.setlist.fm API

# SYNOPSIS

    use WebService::SetlistFM;

    my $setlistfm = new WebService::SetlistFM;
    my $data = $setlistfm->artist('65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab');
    $data = $setlistfm->city('5392171');
    $data = $setlistfm->search_artists({
            'artistName' => 'Metallica',
                'artistMbid' => '65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab',
    });
    $data = $setlistfm->search_cities({ name => 'Shibuya' });
    $data = $setlistfm->search_countries(;
    $data = $setlistfm->search_setlists({
            artistName => 'Megadeth',
                year => 2014,
    });
    $data = $setlistfm->search_venues({name => 'Shibuya'});
    $data = $setlistfm->setlist('3bd6440c');
    $data = $setlistfm->user('fuzy');
    $data = $setlistfm->venue('33d6d4ac');
    $data = $setlistfm->artist_setlists('65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab');
    $data = $setlistfm->setlist_lastfm('999009');
    $data = $setlistfm->setlist_version('6bd45a36');
    $data = $setlistfm->user_attended('fuzy');
    $data = $setlistfm->user_edited('fuzy');
    $data = $setlistfm->venue_setlists('33d6d4ac');
    $data = $setlistfm->artist_tour(
        '65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab', 
        'World Magnetic'
    );

# DESCRIPTION

The module provides a simple interface to the www.setlist.fm API.

# METHODS
These methods usage: http://api.setlist.fm/docs/ 

### artist

### city

### search\_artists

### search\_cities

### search\_countries

### search\_setlists

### search\_venues

### setlist

### user

### venue

### artist\_setlists

### setlist\_lastfm

### setlist\_version

### user\_attended

### user\_edited

### venue\_setlists

### artist\_tour

# SEE ALSO

http://api.setlist.fm/docs/

# LICENSE

Copyright (C) Hondallica.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

Hondallica <hondallica@gmail.com>
