require 'pry'

class Artist
  attr_accessor :name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song
  end

  def self.find_or_create_by_name(artist_name)
    if self.all.detect {|artist| artist.name == artist_name} == nil
      Artist.new(artist_name)
    else
      self.all.detect {|artist| artist.name == artist_name}
    end
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end
end
