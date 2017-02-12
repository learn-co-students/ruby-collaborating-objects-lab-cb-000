class Song
  attr_accessor :artist, :name, :genre

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    artist, name, genre = filename.split(" - ")
    song = Song.new(name)
    artist = Artist.find_or_create_by_name(artist)

    song.artist = artist
    song.genre = genre
    artist.add_song(song)
    song
  end

end