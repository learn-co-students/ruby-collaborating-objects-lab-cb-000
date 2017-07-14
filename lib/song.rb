class Song
  attr_accessor :name, :artist, :genre

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    filename_arr = filename.split(" - ")
    song_name = filename_arr[1]
    artist_name = filename_arr[0]
    song_inst = Song.new(song_name)
    song_inst.artist = Artist.find_or_create_by_name(artist_name)
    song_inst.artist.add_song(song_inst)
    song_inst
  end

end


#Song.new_by_filename('Michael Jackson - Black or White - pop.mp3')
