class Song
  attr_accessor :artist, :name, :genre
  @@all = []
  def initialize(name)
    @name = name
  end

  def self.create_from_filename_by_filename(filename)
    title, artist, genre = filename.split('.').first.split(' - ')
    song = self.new_by_title_artist_genre(title, artist, genre)
    song.save
  end

  def self.new_by_filename(filename)
    artist, name, genre = filename.split('.').first.split(' - ')
    song = Song.new(name)
    song.genre = genre
    artist = Artist.find_or_create_by_name(artist)
    artist.add_song(song)
    song
  end

  def self.new_by_title_artist_genre(title, artist, genre)
    song = Song.new(title)
    song.artist = artist
    song.genre = genre
    song
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

end
