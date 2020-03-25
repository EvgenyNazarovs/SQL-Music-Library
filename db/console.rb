require("pry")
require_relative("../models/album")
require_relative("../models/artist")

Album.delete_all
Artist.delete_all


artist1 = Artist.new({
  'name' => 'David Bowie'
  })

artist1.save

artist2 = Artist.new({
  'name' => 'John Maus'
  })

artist2.save

artist3 = Artist.new({
  'name' => 'Kino'
  })

artist3.save

album1 = Album.new({
  'title' => 'Low',
  'genre' => 'Rock/Electronic',
  'artist_id' => artist1.id
  })
#
album1.save

album2 = Album.new({
  'title' => 'Heroes',
  'genre' => 'Rock/Electronic',
  'artist_id' => artist1.id
  })

  album2.save

  album3 = Album.new({
    'title' => 'We Must Become Pitiless Censors of Ourselves',
    'genre' => 'Electronic',
    'artist_id' => artist2.id
    })

  album3.save

  album4 = Album.new({
    'title' => 'Gruppa Krovi',
    'genre' => 'Rock',
    'artist_id' => artist3.id
    })

  album4.save

  albums = Album.find_all
  artists = Artist.find_all

  binding.pry
  nil
