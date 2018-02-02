class Song
  attr_accessor :name, :artist, :genre

  def initialize(name)
    self.name = name
  end

  def self.new_by_filename(filename)
    artist, song, genre = filename.split(' - ')
    song = Song.new(song)
    song.artist = artist
    song.genre = genre[0..-5]
    song.artist_name = artist
    song
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
end
