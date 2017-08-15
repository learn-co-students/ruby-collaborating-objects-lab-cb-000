require "pry"

class Song

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    artist_name = filename.split(' - ')[0]
    name = filename.split(' - ')[1]
    new_song = Song.new(name)
    artist = Artist.find_or_create_by_name(artist_name)
    new_song.artist = (artist)
    new_song
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def artist
    @artist
  end
end
