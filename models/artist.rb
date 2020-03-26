require_relative('../db/sql_runner')
require_relative('album')

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end



# creates and saves artists
  def save
    sql = "INSERT INTO artists (name)
           VALUES ($1)
           RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

# deletes all artists
  def self.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run(sql, [])
  end

# finds all artists
  def self.find_all
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql, [])
    return artists.map {|artist_hash| Artist.new(artist_hash)}
  end

# finds artist by id
  def self.find_by_id(id)
    sql = "SELECT * FROM artists
           WHERE id = $1"
    values = [id]
    artists_hash = SqlRunner.run(sql, values).first
    return nil if artists_hash == nil
    return Artist.new(artists_hash)
  end

  def albums
    sql = "SELECT * FROM albums
           WHERE artist_id = $1"
    values = [@id]
    albums = SqlRunner.run(sql, values)
    return albums.map {|album_hash| Album.new(album_hash)}
  end

  def update_record
    sql = "UPDATE artists
           SET name = $1
           WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_artist(artist)
    sql = "DELETE FROM artists
           WHERE id = $1"
    values = [artist.id]
    SqlRunner.run(sql, values)
  end


end
