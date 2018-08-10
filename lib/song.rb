class Song

attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    array = filename.split(" - ")
    song_name = array[1]
    artist = array[0]
    song = self.new(array[1])
    song.artist = Artist.find_or_create_by_name(artist)
    song.artist.add_song(song)
    song
  end

end
