class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  #creates new instance of a song from the file that is passed in
  def self.new_by_filename(filename)
    #shortcut for filename[0],filename[1]
    artist, song = filename.split(' - ')
    new_song = self.new(song)
    #call the artist_name= method below
    new_song.artist_name = artist
    new_song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end


end
