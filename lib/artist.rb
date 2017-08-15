require 'pry'
class Artist
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    result = @@all.detect{|artist| artist.name==name}
    result ? result : self.new(name)
    #binding.pry
  end

  def print_songs
    @songs.each{|song|puts song.name}
  end
      
end

#me = Artist.find_or_create_by_name("Dan")