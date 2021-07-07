require 'pry'

class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    file = file_name[0..-5]
    artist, name, genre = file.split(' - ')
    new_song = Song.new(name)
    artist = Artist.find_or_create_by_name(artist)
    artist.add_song(new_song)
    new_song.artist = artist
    new_song
  end
end
