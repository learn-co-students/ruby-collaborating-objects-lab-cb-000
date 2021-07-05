require 'pry'

class Artist
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
    @@all = @@all.uniq
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    if self.all.any? { |artist| artist.name == name}
      self.all.detect { |artist| artist.name == name}
    else
      self.new(name)
    end
  end

  def print_songs
    self.songs.each { |song| puts song.name}
  end
end
