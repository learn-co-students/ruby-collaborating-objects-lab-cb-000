require 'pry'
# Song class
class Song
  attr_accessor :name, :artist

  def initialize(song_name)
    @name = song_name
  end

  def artist_name=(artist)
    self.artist = Artist.find_or_create_by_name(artist)
    artist.add_song(self)
  end

  def self.new_by_filename(file_name)
    artist, name = file_name.split(' - ')
    song = Song.new(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song
  end
end
