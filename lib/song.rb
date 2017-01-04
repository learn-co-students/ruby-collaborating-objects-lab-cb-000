class Song

  attr_reader :name, :artist

  def initialize(name)
    @name = name
  end

  def name=(name)
    @name = name
  end

  def artist=(artist)
    @artist = artist
  end

  def artist_name=(artist)
    @artist = Artist.find_or_create_by_name(artist)
    self.artist.add_song(@name)
  end

  def self.new_by_filename(file_name)
    file_name = file_name.split(" - ")
    song = Song.new(file_name[1])
    song.artist_name = file_name[0]
    song
  end
end
