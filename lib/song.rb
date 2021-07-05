require 'pry'

class Song
  attr_accessor :name, :artist

  def initialize(title)
    @name = title
  end

  #def artist_name(name)
  #  Artist.find_or_create_by_name(name)
  #end

  def self.new_by_filename(filename)
    data = filename.split(" - ")

    #create the song
    song = self.new(data[1])

    #create the artist if it does not exist
    #song.artist = songsong.artist_name(data[0])
    artist = Artist.find_or_create_by_name(data[0])

    #song is by the artist
    song.artist = artist

    #artist has many songs
    song.artist.add_song(song)
    song.artist.save
    song
  end
end
