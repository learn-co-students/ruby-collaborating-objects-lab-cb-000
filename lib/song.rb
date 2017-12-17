class Song
  # sets the song name
  # sets the artist object to belong to the song
  attr_accessor :name, :artist

  # #initialize with #name
  def initialize(name)
    @name = name
  end

  # creates a new instance of a song from the file that's passed in
  def self.new_by_filename
  end
end
