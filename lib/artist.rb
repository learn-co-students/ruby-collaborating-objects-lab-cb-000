require 'pry'
class Artist
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
    self.save
  end
  def add_song(song)
    self.songs << song
    #binding.pry
  end
  def self.all
    @@all
  end
  def save
    self.class.all << self
  end
  def self.find_or_create_by_name(name)
    artist_searched = self.all.find {|artist| artist.name == name}
    if artist_searched != nil
      artist_searched
    else
      new_artist = Artist.new(name)
    end
  end
  def print_songs
    self.songs.each do |song|
      puts song.name
    end
  end
end
