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
  def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : self.create(name) # if given artist name is found, return found name; else create artist name
  end

  # given an artist name, find all songs that belong to that artist
  def self.find(name)
    self.all.find { |artist| artist.name == name}
  end

  # create & save a new artist if artist name does not exist
  def self.create(name)
    self.new(name).tap { |artist| artist.save }
  end

  # lists all of the artist's songs
  def print_songs
    songs.each { |song| puts song.name }
  end
end


=begin
  #tap method: Yields x to the block, and then returns x

  https://apidock.com/ruby/Object/tap

  https://medium.com/aviabird/ruby-tap-that-method-90c8a801fd6a
=end
