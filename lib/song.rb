class Song
attr_accessor :name, :artist

#Sets name variable
  def initialize(name)
    @name = name
  end

#Connects new song with Artist by finding it in Artist search
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

#Creates an array of title and artist by spltting for setting
  def self.new_by_filename(file)
    data_array = file.chomp(".mp3").split(" - ")
    song = Song.new(data_array[1])
    song.artist_name = data_array[0]
    song
  end

end
