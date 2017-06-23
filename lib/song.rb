class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def artist_name=(name)
    name = new.Artist
  end

  def self.new_by_filename(filename)
    song = self.new
    song.artist  = filename.split
    song.name = filename.split(" - ")[1]
    song
  end
end
