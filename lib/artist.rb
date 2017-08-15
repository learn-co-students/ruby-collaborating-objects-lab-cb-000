class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_song_by_name(song_name)
    song = Song.new(song_name)
    add_song(song)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create_by_name(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def self.find_or_create_by_name(name)
    artist = @@all.detect{|artist| artist.name == name}
    if artist.nil?
      artist = self.create_by_name(name)
    end
    artist
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end
end
