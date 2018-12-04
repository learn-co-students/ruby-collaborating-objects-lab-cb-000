class Song
  attr_accessor(:name,:artist)
  @@all=[]

  def initialize(name)
    @name=name
  end

  def self.new_by_filename(filename)
    name=filename.split(" - ")[1]
    song=Song.new(name)
    artist=filename.split(" - ")[0]
    this_artist=Artist.find_or_create_by_name(artist)
    song.artist=this_artist
    this_artist.add_song(song)
    song
  end

end
