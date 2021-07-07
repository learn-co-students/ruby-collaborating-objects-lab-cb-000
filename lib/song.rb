class Song
  attr_accessor :name, :artist
  
  def initialize(name)
    @name = name
  end
  
  
  def self.new_by_filename(filename)
    files = filename.split(' - ')
    the_artist = files[0]
    the_title = files [1]
    song = Song.new(the_title)
    song.artist_name=(the_artist)
    return song
  end
  
  def artist_name=(a_name)
    a = Artist.find_or_create_by_name(a_name)
    a.add_song(self)
    self.artist=(a)
  end
  
  def name=(name)
   @name = name
  end
  
  
  def artist=(artist)
    @artist = artist
  end  
  
end