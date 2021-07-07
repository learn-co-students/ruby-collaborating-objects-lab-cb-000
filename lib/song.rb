class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

#  def self.new_by_filename(filename)
#    song = self.new
#    song.name = filename.split(" - ")[1]
#    song.artist.name = filename.split(" - ")[2]
#  end

#  def artist=(name)
#    new_artist = Artist.new(name)
#    song.artist = new_artist
#  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.new_by_filename(filename)
    new_song = Song.new(filename.split(" - ")[1])
    new_artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    new_artist.add_song(new_song)
    new_song.artist = new_artist
    new_song
  end


  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end


end
