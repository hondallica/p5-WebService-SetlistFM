use strict;
use Test::More 0.98;
use WebService::SetlistFM;
use Data::Dumper;

my $setlistfm = new WebService::SetlistFM;
isa_ok $setlistfm, 'WebService::SetlistFM';
isa_ok $setlistfm->{http}, 'Furl::HTTP';

subtest artist => sub {
    my $artist = $setlistfm->artist('65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab');
    is $artist->{artist}{'@disambiguation'}, '';
    is $artist->{artist}{'@mbid'}, '65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab';
    is $artist->{artist}{'@name'}, 'Metallica';
    is $artist->{artist}{'@sortName'}, 'Metallica';
    is $artist->{artist}{'@tmid'}, '735647';
    is $artist->{artist}{'url'}, 'http://www.setlist.fm/setlists/metallica-3bd680c8.html';
};


subtest city => sub {
    my $city = $setlistfm->city('5392171');
    is $city->{city}{'@id'}, '5392171';
    is $city->{city}{'@name'}, 'Loyola';
    is $city->{city}{'@state'}, 'California';
    is $city->{city}{'@stateCode'}, 'CA';
    is $city->{city}{coords}{'@lat'}, '37.3513302';
    is $city->{city}{coords}{'@long'}, '-122.100518';
    is $city->{city}{country}{'@code'}, 'US';
    is $city->{city}{country}{'@name'}, 'United States';
};

subtest search_artists => sub {
    my $artists = $setlistfm->search_artists({
        'artistName' => 'Metallica',
        'artistMbid' => '65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab',
    });
    is $artists->{artists}{artist}{'@mbid'}, '65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab';
    is $artists->{artists}{artist}{'@disambiguation'}, '';
    is $artists->{artists}{artist}{'@tmid'}, '735647';
    is $artists->{artists}{artist}{'@sortName'}, 'Metallica';
    is $artists->{artists}{artist}{'url'}, 'http://www.setlist.fm/setlists/metallica-3bd680c8.html';
    is $artists->{artists}{artist}{'@name'}, 'Metallica';
    is $artists->{artists}{'@total'}, 1;
    is $artists->{artists}{'@page'}, 1;
    is $artists->{artists}{'@itemsPerPage'}, 30;
};

subtest search_cities => sub {
    my $cities = $setlistfm->search_cities({ name => 'Shibuya' });
    ok $cities;
};

subtest search_countries => sub {
    my $countries = $setlistfm->search_countries();
    ok $countries;
};

subtest search_setlists => sub {
    my $setlists = $setlistfm->search_setlists({
        artistName => 'Megadeth',
        year => 2014,
    });
    ok $setlists;
};

subtest search_venues => sub {
    my $venues = $setlistfm->search_venues({name => 'Shibuya'});
    ok $venues;
};

subtest setlist => sub {
    my $setlist = $setlistfm->setlist('3bd6440c');
    ok $setlist;
};

subtest user => sub {
    my $data = $setlistfm->user('fuzy');
    ok $data;
};

subtest venue => sub {
    my $data = $setlistfm->venue('33d6d4ac');
    ok $data;
};

subtest artist_setlists => sub {
    my $data = $setlistfm->artist_setlists('65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab');
    ok $data;
};

subtest setlist_lastfm => sub {
    my $data = $setlistfm->setlist_lastfm('999009');
    ok $data;
};

subtest setlist_version => sub {
    my $data = $setlistfm->setlist_version('6bd45a36');
    ok $data;
    warn Dumper $data;
};

subtest user_attended => sub {
    my $data = $setlistfm->user_attended('fuzy');
    ok $data;
};

subtest user_edited => sub {
    my $data = $setlistfm->user_edited('fuzy');
    ok $data;
};

subtest venue_setlists => sub {
    my $data = $setlistfm->venue_setlists('33d6d4ac');
    ok $data;
};

subtest artist_tour => sub {
    my $data = $setlistfm->artist_tour('65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab', 'World Magnetic');
    ok $data;
};

done_testing;

