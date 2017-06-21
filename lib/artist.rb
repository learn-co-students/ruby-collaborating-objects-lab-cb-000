class Artist
  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
  end

  def songs
    @songs
  end

  def print_songs
    self.songs.each {|x| puts x.name}
  end

  def find_or_create_by_name(name)

  end

  def save
    @@all << self
  end
end
