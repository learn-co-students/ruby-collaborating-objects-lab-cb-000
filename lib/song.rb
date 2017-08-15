class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    arr = file_name.split(" - ")    
    song = Song.new(arr[1])    
    song.artist = Artist.find_or_create_by_name(arr[0])
    song.artist.songs << song
    song
  end
end