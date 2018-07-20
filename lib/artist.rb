require 'pry'

class Artist
  attr_accessor :name, :songs

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @songs = []
    @name = name
<<<<<<< HEAD
    # @@all << self
=======
>>>>>>> 3d6956dade336b1fc9bb1b6c6d27dd483124fe7e
  end

  def add_song(song)
    # song.artist = self
    @songs << song
  end

  def save
    @@all << self
  end

<<<<<<< HEAD
  def self.find_or_create_by_name(name)
    artist = @@all.find do |artist| artist.name == name end
      # binding.pry
    artist ? artist[0] : self.create(name)
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
    self.new(name).tap {|artist| artist.save}
  end

  def print_songs
    songs.each {|song| puts song.name}
  end
=======
  def self.find_or_create_by_name(name)
    artist = @@all.select do |artist| artist.name == name end
      binding.pry
    artist[0] ? artist : self.new(name)
  end


>>>>>>> 3d6956dade336b1fc9bb1b6c6d27dd483124fe7e
end
