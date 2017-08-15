class Song
  attr_accessor :name, :artist

  def initialize name
    self.name = name
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def self.new_by_filename file_name
    song = Song.new(file_name.split(" - ")[1])
    song.artist = Artist.find_or_create_by_name(file_name.split(" - ")[0])
    song.artist.add_song(song)
    song
  end
end
