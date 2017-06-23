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
    songs.each {|x| puts x.name}
  end

  def self.find_or_create_by_name(name)
    search_by_name(name) ? search_by_name(name) : create_by_name(name)
  end

  def self.create_by_name(name)
    new_Artist = Artist.new(name)
    new_Artist.save
  end

  def self.search_by_name(name)
    self.all.detect {|x| x = name}
  end

  def save
    @@all << self
  end
end
