require 'pry'

class Song
  attr_accessor :name, :artist, :artist_name

  def initialize(name)
    @name = name
  end

  def artist_name(name)
    Artist.find_or_create_by_name(name)
  end

  def self.new_by_filename(file)
    filename = file.split(" - ")
    song = Song.new(filename[1])
    song.artist = song.artist_name(filename[0])
    song.artist.add_song(song)
    song.artist.save
    song
  end

end
