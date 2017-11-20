class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def name=(name)
    @name = name
  end

  def artist=(artist_name)
    @artist = Artist.find_or_create_by_name(artist_name)
    @artist.add_song(self)
    @artist
  end

  def self.new_by_filename(file)
    info = file.split(" - ")
    song = Song.new(info[1])
    song.artist = info[0]
    song
  end

end
