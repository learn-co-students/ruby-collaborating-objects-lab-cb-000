class Song 
  attr_accessor :name, :artist
  
  @@all = []
  
  def self.all 
    @@all 
  end 
  
  def initialize(name)
    @name = name 
    self.class.all << self 
  end 
  
  def self.new_by_filename(name)
    parse = name.split(" - ")
    artist = Artist.find_or_create_by_name(parse[0])
    song = Song.new(parse[1])
    artist.add_song(song)
    song.artist = artist 
    song
  end 
  
  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    self.artist = artist 
  end 
  
end 