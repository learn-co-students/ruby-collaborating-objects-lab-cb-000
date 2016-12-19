
class Song
  attr_accessor :name, :artist, :genre

  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def self.new_by_filename(file)
    data = file.split(" - ")
    song = Song.new(data[1])
    song.artist = Artist.find_or_create_by_name(data[0])
    song.artist.add_song(song)
    song
  end
end
