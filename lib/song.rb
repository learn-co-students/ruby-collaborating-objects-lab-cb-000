class Song
  # sets the song name
  # sets the artist object to belong to the song
  attr_accessor :name, :artist

  # #initialize with #name
  def initialize(name)
    @name = name
  end

  # creates a new instance of a song from the file that's passed in
  def self.new_by_filename(filename)
    artist = filename.split(' - ')[0]
    song = filename.split(' - ')[1]

    new_song = self.new(song)
    new_song.artist_name = artist

    new_song
  end

  # finds or creates an artist by name
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
end
