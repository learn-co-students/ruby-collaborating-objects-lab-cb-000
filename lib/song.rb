class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end


  def self.new_by_filename(name)
    song = Song.new(name.split(" - ")[1])
    song.artist_name=(name.split(" - ")[0])
    song.artist.add_song(self)
    song
  end

  def artist_name=(artist_name)
    @artist = Artist.find_or_create_by_name(artist_name)
  end
end
