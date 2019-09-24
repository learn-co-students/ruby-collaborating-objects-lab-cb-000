class Song

  attr_accessor :name, :artist, :artist_name

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file)
    parse = file.split(" - ")
    name = parse[0]
    song_name = parse[1]
    song = self.new(song_name)
    song.artist_name = name
    song
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    self.artist = artist
    artist.add_song(self)
  end

end
