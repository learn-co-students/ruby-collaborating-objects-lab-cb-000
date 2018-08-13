class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.new_by_filename(filename)
    filename.slice!(".mp3")
    song_data = filename.split(" - ")
    artist = song_data[0]
    name = song_data[1]
    genre = song_data[2]
    song = self.new(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.artist.add_song(song)
    song.genre = genre
    song
  end
end
