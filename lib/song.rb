require 'pry'
class Song
  attr_accessor :name
  attr_reader :artist
  def initialize(name)
    @name = name
  end
  def self.new_by_filename(filename)
    file = filename.split(" - ")
    artist_name = file[0]
    song_name = file[1]
    
    song = Song.new(song_name)
  #  binding.pry
    song.artist = artist_name
    #binding.pry
    song.artist.add_song(song)
    song
    #binding.pry
  end

  def artist=(artist_name)
    #binding.pry
    if(artist_name.class==String)
      
      @artist = Artist.find_or_create_by_name(artist_name)
    else @artist = artist_name                                         # so confused. now really messy. oh well
    end
  end
end

#me = Artist.new("je")
#song = Song.new_by_filename("Michael Jackson - Black or White - pop.mp3")