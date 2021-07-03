class Artist
  attr_accessor :name

  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_song_by_name(name)
    song = Song.new(name)
    add_song(song)
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    result = @@all.find {|artist| artist.name == name}
    result.nil? ? Artist.new(name) : result
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end

end
