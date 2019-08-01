class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name)
    @name = name
  end

  def artist_name=(name)
    if self.artist.nil?
      self.artist = Artist.new(name)
    else
      self.artist.name = name
    end
  end

  def self.new_by_filename(file)
    data = file.split(" - ")
    artist = data[0]
    name = data[1]
    song = self.new(name)
    song.artist_name = artist
    song.artist.add_song(song)
    song.artist.save
    @@all << song
    song
  end

end
