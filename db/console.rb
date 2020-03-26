require("pry")
require_relative("../models/album")
require_relative("../models/artist")

# Album.delete_all
# Artist.delete_all


artist1 = Artist.new({
  'name' => 'David Bowie'
  })

# artist1.save

artist2 = Artist.new({
  'name' => 'John Maus'
  })

# artist2.save

artist3 = Artist.new({
  'name' => 'Kino'
  })

# artist3.save

album1 = Album.new({
  'title' => 'Low',
  'genre' => 'Rock/Electronic',
  'artist_id' => artist1.id
  })
#
# album1.save

album2 = Album.new({
  'title' => 'Heroes',
  'genre' => 'Rock/Electronic',
  'artist_id' => artist1.id
  })

  # album2.save

  album3 = Album.new({
    'title' => 'Become Pitiless Censors of Ourselves',
    'genre' => 'Synth',
    'artist_id' => artist2.id
    })

  # album3.save

  album4 = Album.new({
    'title' => 'Gruppa Krovi',
    'genre' => 'Rock',
    'artist_id' => artist3.id
    })

  # album4.save



  found_artist = Artist.find_by_id(25)
  albums_by_artists = found_artist.albums

  found_album = Album.find_album_by_id(28)
  found_album.artist

  found_artist.name = "BOWIE"
  found_artist.update_record

  found_album.genre = "Synth"
  found_album.update_record()


  binding.pry
  nil
