class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file)
    info = file.split(" - ")
    song = Song.new(info[1])
    song.artist = Artist.find_or_create_by_name(info[0])
    song.artist.add_song(song)
    song
  end

end
