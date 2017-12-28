class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    split = file_name.split(" - ")
    artist_name = split[0]
    song_name = split[1]
    genre = split[2].split(".mp3")[0]
    song = self.new(song_name)
    song.artist = Artist.new(artist_name)
    song
  end

end
