class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    self.artist.add_song(self)
  end

  def self.new_by_filename(file_name)
    song_data = file_name.split(" - ")
    song = self.new(song_data[1])
    song.artist_name = song_data[0]
    song
  end
end
