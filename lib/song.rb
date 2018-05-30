class Song

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def name=(name)
    @name = name
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def artist
    @artist
  end

  def self.new_by_filename(filename)
    new_song = Song.new(filename.split(" - ")[1])
    new_artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    new_artist.add_song(new_song)
    new_song.artist = new_artist
    new_song
  end

end
