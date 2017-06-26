class Artist
  @@all = []

  attr_accessor :name, :songs

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

  def print_songs
    songs.each {|x| puts x.name}
  end

  def self.find_or_create_by_name(name)
    search_by_name(name) ? search_by_name(name) : create_by_name(name)
  end

  def self.create_by_name(name)
    self.new(name).tap {|artist| artist.save}
  end

  def self.search_by_name(name)
    self.all.detect {|x| x.name == name}
  end

  def save
    @@all << self
  end
end
