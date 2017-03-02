class Song
  attr_accessor :name, :artist #correct
    @@all = []  #didn't have this
  def initialize(name) #correct
    @name = name
    @@all << self
  end

=begin
  def self.find_by_artist(artist)
    Song.all.select do |song|
      song.artist == artist
    end
  end
=end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end


  def self.new_by_filename(file_name) # this is "arist_name - song_name" for a file
    artist, song = file_name.split(" - ")
    song = self.new(song)
    song.artist_name=(artist)


    #song.artist_name(song.artist)
    #song.artist = song.artist_name=(artist)
    #song.artist.name = artist

    song
  end

  def self.all
    @@all
  end

end
