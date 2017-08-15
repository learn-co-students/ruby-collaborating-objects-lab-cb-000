class Song

  @@all = []

  attr_accessor :name, :artist

  def initialize( title )
    @name = title
  end

  def self.new_by_filename( filename )

    song_title = filename.split(" - ")[1]
    newSong = self.new( song_title )
    newSong.artist_name = filename.split(" - ")[0]
    newSong.save
  end

  def artist_name=( name )
    self.artist = Artist.find_or_create_by_name( name )
    artist.add_song( self )
  end

  def save
    @@all << self
    self
  end

  def self.all
    @@all
  end

end  # class Song
