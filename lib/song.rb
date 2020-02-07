class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  ############CLASS METHODS###########

  def self.new_by_filename(filename)
    filename_breakdown = filename.scan(/(.+) - (.+) - (.+)/)
    name = filename_breakdown[0][1]
    artist = filename_breakdown[0][0]
    song = Song.new(name)
    song.artist_name = artist
    song
  end

###########INSTANCE METHODS############

  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
    @artist = artist
  end
end
