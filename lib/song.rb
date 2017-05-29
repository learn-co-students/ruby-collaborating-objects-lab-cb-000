class Song
#The Song class will be responsible for creating songs given each filename and sending the artist's name (a string) to the Artist class
  attr_accessor :name, :artist

  def initialize(name)
    @name = name

  end

  def self.new_by_filename(filename)
    name_str = filename.split(" - ")[1]
    artist_str = filename.split(" - ")[0]
    song = self.new(name_str)
    song.artist_name = artist_str
    artist = Artist.find_or_create_by_name(artist_str)
    artist.add_song(song)
    song.artist = artist
    # song.artist.name = song.artist_name
    song
  end

  def artist_name=(str)
    Artist.find_or_create_by_name(str)
  end


end
