class Song

attr_reader :name, :artist

@@all = []

  def initialize(name)
    @name = name
  end

  def name=(name)
    @name = name
  end

  def artist=(artist)
    @artist = artist
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.new_by_filename(filename)
    artist, song = filename.split(" - ")
    new_song = self.new(song)
    new_song.artist_name = artist
    new_song.save
  end
end
