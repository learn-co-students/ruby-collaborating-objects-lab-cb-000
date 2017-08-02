class Artist
  attr_accessor :name, :songs

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
    self.all.any? { | n | n.name == name } ? self.all.detect { | n | n.name == name } : new_artist = Artist.new(name)
  end

  def print_songs
    self.songs.each { | song | puts song.name }
  end

end
