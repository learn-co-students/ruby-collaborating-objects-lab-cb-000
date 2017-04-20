class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    song = Song.new(filename.split("-")[1].strip)
    song.artist = Artist.find_or_create_by_name(filename.split("-")[0].strip)
    song.artist.add_song(song)
    song
  end

end

#file_name = "Michael Jackson - Black or White - pop.mp3"
#new_instance = Song.new_by_filename(file_name)
