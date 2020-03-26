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



  bowie = Artist.find_by_id(25)
  bowie_albums = bowie.albums
  p "Second album in our Bowie collection is called '#{bowie_albums[1].title}'."

  # gruppa_krovi = Album.find_by_id(29)
  # gruppa_krovi.artist

  bowie.name = "D Bowie"
  bowie.update_record

  # gruppa_krovi.genre = "Soviet Rock"
  # gruppa_krovi.update_record

  # Album.delete_album(gruppa_krovi)

  new_search = Album.find_by_artist(bowie)
  p "We have the following albums: #{new_search[0].title}, #{new_search[1].title}"

  # binding.pry
  # nil
