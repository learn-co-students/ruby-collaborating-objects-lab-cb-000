class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def artist_name=(artist_name)
    artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(self)
    @artist = artist
  end

  def self.new_by_filename(filename)
    # Filenames look like: "Arist - Song.mp3"
    details = filename.sub(/.mp3/,"").split(" - ")
    new_song = self.new(details[1])
    new_song.artist_name = details[0]
    new_song
  end
end
