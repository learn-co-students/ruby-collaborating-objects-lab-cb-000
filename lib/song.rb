class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end


  def self.new_by_filename(filename)
    artist_name, song_name = filename.split(" - ") #this splits them both and gives them [0] and [1] respectively
    song = self.new(song_name)
    artist = Artist.find_or_create_by_name(artist_name) #this connects to the artist class to send it the artist name
    song.artist = artist #tells it to set the artist when asked(artist=)
    artist.add_song(song) #connects to the artist class to add_song method
    song
  end

end
