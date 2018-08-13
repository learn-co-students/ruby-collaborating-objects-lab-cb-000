class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name = nil)
    @name = name
    @songs = []
    self.save
  end

  def add_song(song)
    self.songs << song
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.detect do |artist|
      artist.name == name
    end
  end

  def self.create(name)
    artist = self.new(name)
  end

  def self.find_or_create_by_name(name)
    artist = self.find_by_name(name)
    artist ? artist : self.new(name)
  end

  def print_songs
    self.songs.each do |song|
      puts song.name
    end
  end
end
