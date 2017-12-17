class Artist
  # accepts a name for the artist
  # keeps track of an artist's songs
  attr_accessor :name, :songs

  @@all = []

  # initialize with name
  def initialize(name)
    @name = name
    @songs = []
  end

  # keeps track of an artist's songs
  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
  end

  # adds the artist instance to the @@all class variable
  def save
    @@all << self
  end

  # finds or creates an artist by name maintaining uniqueness of objects by name property
  # Creates new instance of Artist if none exist
  def self.find_or_create_by_name
  end

  # lists all of the artist's songs
  def print_songs
  end
end
