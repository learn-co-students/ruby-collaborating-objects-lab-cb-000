require 'pry'
class Artist
  @@all = []
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
    self
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.new_by_name(name)
    artist = self.new(name)
    artist
  end

  def self.create_by_name(name)
    artist = self.new_by_name(name)
    artist.save
    artist
  end

  def self.find_by_name(name)
    self.all.detect {|artist| artist.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def print_songs
    @songs.each do |i|
      puts i.name
    end
  end

end
