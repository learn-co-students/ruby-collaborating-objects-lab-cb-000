class Song

  attr_accessor :name, :artist
  @@songs = []
  def initialize(name = nil)
    @name = name


  end

  def artist_name
    return nil if self.artist == nil
    self.artist.name

  end

  def self.new_by_filename(filename)
    file = filename.split(" - ")
    create_artist = Artist.find_or_create_by_name(file[0])
    create_artist.save
    song = Song.new(file[1])
    song.artist = create_artist
    create_artist.songs << song
    song.save
    song

  end
  def save
    @@songs << self
  end



end
