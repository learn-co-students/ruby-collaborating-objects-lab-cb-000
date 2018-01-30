class Song
  attr_accessor :title, :artist

  def initialize(title)
    @title = title
  end

  def self.new_by_filename(filename)
    song = Song.new(filename.split(" - ")[1])
    artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    artist.add_song(song)
    song.artist = artist
    song
  end

end
