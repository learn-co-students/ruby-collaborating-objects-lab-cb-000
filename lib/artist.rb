class Artist

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def songs
    @songs
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
    artist = @@all.detect { |obj| obj.name == name }
    artist.nil? ? artist = self.new(name) : artist
  end

  def print_songs
    @songs.each { |song| puts song.name }
  end

end