class Artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def add_song(song_name)
    self.songs << song_name
  end

  def songs
    @songs
  end

  def self.find_or_create_by_name(name)
    self.find(name) || self.create(name)
  end

  def self.find(name)
    self.all.find {|artist| artist.name == name }
  end

  def self.create(name)
    self.new(name)
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

end
