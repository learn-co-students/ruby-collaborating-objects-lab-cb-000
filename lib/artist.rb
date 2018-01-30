require "pry"

class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @songs = []
    @name = name
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
    unless @@all.detect { |e| e.name == name }
     Artist.new(name).save
    end
    @@all[-1]
  end

  def print_songs
    @songs.each { |e| puts e.title }
  end

end
