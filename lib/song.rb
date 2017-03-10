class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file)
    file_array = file.split(" - ")
    name = file_array[1]
    artist = file_array[0]
    song = self.new(name)
    song.artist_name = artist
    song
  end

  def artist_name=(name)
    @artist = Artist.find_or_create_by_name(name)
    @artist.add_song(self)
  end

end
