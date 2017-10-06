require 'pry'
class Song
attr_accessor :name, :artist

  def initialize(song_name)
    @name = song_name
  end

  def self.new_by_filename(song)
    #binding.pry
    song_array = song.split("-")
    song_instance = Song.new(song_array[1].strip)
    artist = artist_name(song_array[0].strip)
    #binding.pry
    song_instance.artist = artist
    song_instance
  end

  def self.artist_name(artist)
    new_artist_song = Artist.find_or_create_by_name(artist)
    #Artist.add_song(song_instance)
    new_artist_song
  end
end
