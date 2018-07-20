require 'pry'

class Artist
  attr_accessor :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
  end

  def add_song(song)
    # song.artist = self
    song.artist = self
    song.save
  end
  
  def songs
    Song.all.select {|song| song.artist == self}
    # binding.pry
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
    artist = @@all.find do |artist| artist.name == name end
      #  binding.pry
    artist ? artist : self.create(name)
    # binding.pry
  end
  # 
  # def self.find_or_create_by_name(name)
  #   self.find(name) ? self.find(name) : self.create(name)
  # end

  def self.find(name)
    self.all.find {|artist| artist.name == name }
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    # artist = self.new(name).tap {|artist| artist.save}
    artist
  end

  def print_songs
    songs.each {|song| puts song.name}
  end

  # def self.find_or_create_by_name(name)
  #   artist = @@all.select do |artist| artist.name == name end
  #     binding.pry
  #   artist[0] ? artist : self.new(name)
  # end


end
