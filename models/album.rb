require_relative('../db/sql_runner')
require_relative('artist')

class Album

  attr_accessor :title, :genre, :artist_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save
    sql = "INSERT INTO albums (title, genre, artist_id)
           VALUES ($1, $2, $3)
           RETURNING id"
    values = [@title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def self.delete_all
    sql = "DELETE FROM albums"
    SqlRunner.run(sql, [])
  end

  def self.find_all
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql, [])
    return albums.map {|album_hash| Album.new(album_hash)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM albums
           WHERE id = $1"
    values = [id]
    album_hash = SqlRunner.run(sql, values).first
    return nil if album_hash == nil
    return Album.new(album_hash)
  end

  def artist
    sql = "SELECT * FROM artists
           WHERE id = $1"
    values = [@artist_id]
    artist_hash = SqlRunner.run(sql, values)[0]
    return Artist.new(artist_hash)
  end

  def self.find_by_artist(artist)
    sql = "SELECT * FROM albums
           WHERE artist_id = $1"
    values = [artist.id]
    albums = SqlRunner.run(sql, values)
    return albums.map {|album_hash| Album.new(album_hash)}
  end

  def update_record
    sql = "UPDATE albums
           SET (title, genre) =
           ($1, $2)
           WHERE id = $3"
    values = [@title, @genre, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_album(album)
    sql = "DELETE FROM albums
           WHERE id = $1"
    values = [album.id]
    SqlRunner.run(sql, values)
  end


end
