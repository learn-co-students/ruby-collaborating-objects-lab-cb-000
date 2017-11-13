class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    fn_arr = filename.split(" - ")
    song = Song.new(fn_arr[1])
    song.artist = Artist.find_or_create_by_name(fn_arr[0])
    song.artist.add_song(song)
    song
  end
end
