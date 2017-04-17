class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by_name(artist_name)
  end

  def self.new_by_filename(filename)
    song = self.new(filename)
    song.name = filename.split(" - ")[1]
    song.artist_name = filename.split(" - ")[0]
    song.artist.add_song(song)
    song
  end

end