class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file)
    artist, song = file.split(" - ")
    new_song = self.new(song)
    new_song.artist_name = artist
    new_song
  end
  # class methods can be called from elsewhere by, ex. "Song.new_by_filename"
  # in this case, "Song.new_by_filename" is called in mp3_importer's #import instance method.

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
end
