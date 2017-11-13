class Artist
  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self unless @@all.detect {|artist| artist == self}
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
  end

  def self.find_or_create_by_name(name)
    object = self.all.detect {|artist| artist.name == name}
    if object
      object
    else
      artist = Artist.new(name)
      self.all << artist
      artist
    end
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end

end
