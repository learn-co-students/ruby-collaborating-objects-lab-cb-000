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

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_artist(artist_name)
    @@all.detect { |artist| artist.name == artist_name }
  end

  def self.create_by_name(artist_name)
    artist = Artist.new(artist_name)
    artist.save
    artist
  end

  def self.find_or_create_by_name(artist_name)
    find_artist(artist_name) || create_by_name(artist_name)
  end

  def self.create_from_filename(filename)
    artist, title, genre = filename.split(" - ")
    create_artist_title_genre(artist, title, genre)
  end

  def self.create_artist_title_genre(name, title, genre)
    artist = Artist.find_or_create_by_name(name)
    song = Song.new(title)
    song.genre = genre
    artist.add_song(song)
    artist
  end

  def print_songs
    songs.each { |song| puts song.name}
  end
end