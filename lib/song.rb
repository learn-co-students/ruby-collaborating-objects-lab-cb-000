require 'pry'
class Song
  attr_accessor :artist, :name, :genre
  def initialize(song_name)
    @name = song_name
  end
  def self.add_songs_from_list(list_of_songs)
    list_of_songs.each do |song|
      self.new_by_filename(song)
    end
  end
  def self.new_by_filename(song)
    song_array = song.split(' - ')
    new_song = Song.new(song_array[0])
    #binding.pry
    new_song.artist = Artist::find_or_create_by_name(song_array[0])
    new_song.name = song_array[1]
    new_song.genre = song_array[2]
    new_song.artist.add_song(new_song)
    new_song
  end
  def artist_name=(artist_name)

  end
end
