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
    if @@all.any? { |artist| artist.name == @name } == false
      @@all << self
    end
  end

  def self.all
    @@all
  end

  def print_songs
    @songs.each { |song| puts song.name }
  end

  def self.find_or_create_by_name(name)
    artist = @@all.select { |artist| artist.name == name }.first
    artist != nil ? artist : Artist.new(name)
  end
end
