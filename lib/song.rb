class Song
  attr_accessor :artist, :name
  
  def initialize(name)
    @name = name
  end
  
  def self.new_by_filename(filename)
    song_name = filename.split(' - ')[1]
    artists_name = filename.split(' - ')[0]
    song = new(song_name)
    song.artist_name = artists_name
    song.artist.add_song(song)
    song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end 
  
  def to_s 
    name 
  end 
end 