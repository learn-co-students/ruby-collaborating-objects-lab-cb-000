class Song
  attr_accessor :name, :artist, :file_name

  def initialize(name, artist = nil)
    @name = name
    @artist = artist
  end


  def self.new_by_filename(file_name)

    song.name = filename.split(" - ")[1]
    song
  end

  def self.new_by_filename(file_name)
     data = file_name.split(" - ")
     new_artist = Artist.find_or_create_by_name(data[0])
     new_song = self.new(data[1], new_artist)
     new_artist.add_song(new_song)
     new_song
   end

end
