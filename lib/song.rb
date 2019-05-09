class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name

  end

  def artist_name(artist_name_string)
    artist_object = Artist.find_or_create_by_name(artist_name_string)
    self.artist = artist_object
    artist_object.add_song(self)
  end



  def self.new_by_filename(filename)
    song_name = filename.split(" - ")[1]
    song = self.new(song_name)
    artist_name_string = filename.split(" - ")[0]
    song.artist_name(artist_name_string)
    song.artist = Artist.find_or_create_by_name(artist_name_string)
    song
  end


end
