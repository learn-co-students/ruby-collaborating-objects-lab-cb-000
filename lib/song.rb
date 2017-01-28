class Song

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def artist
    @artist
  end

  def artist=(new_artist)
    new_artist.add_song(self)
    @artist = new_artist
  end

  def self.new_by_filename(filename)
    artist_name, song_name = filename.split(' - ')
    song = Song.new(song_name)
    new_artist = Artist.find_or_create_by_name(artist_name)
    song.artist = new_artist
    song
  end

end

