class Song

  attr_accessor :artist, :name

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    array = file_name.split(" - ")
    title = array[1]
    artist = array[0]
    song = self.new(title)
    song_artist = Artist.find_or_create_by_name(artist)
    song.artist = song_artist
    song_artist.add_song(song)
    song

  end

end
