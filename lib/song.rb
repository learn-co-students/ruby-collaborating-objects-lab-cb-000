class Song
  attr_accessor :name
  attr_reader :artist

  def initialize (name)
    @name = name
  end

  def artist= (artist)
    @artist = artist
  end

  def self.new_by_filename(file)
    filename = file.split(" - ")
    song = Song.new(filename[1])
    song.artist=(Artist.find_or_create_by_name(filename[0]))
    song.artist.add_song(self)
    song
  end
end
