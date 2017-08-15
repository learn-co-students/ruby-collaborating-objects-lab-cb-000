class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    metadata_from_filename = filename.split(/\s-\s|\./)
    song = Song.new(metadata_from_filename[1])
    artist = Artist.find_or_create_by_name(metadata_from_filename[0])
    song.artist = artist
    song
  end

end
