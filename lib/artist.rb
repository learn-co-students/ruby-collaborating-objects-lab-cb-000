class Artist
  @@all = []
  attr_accessor :name, :songs


  def self.find_or_create_by_name(name)
    match = @@all.detect{|artist| name == artist.name}
    match ? match : self.new(name)
  end

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def save
    @@all << self
  end

  def add_song(song)
    @songs << song
  end

  def print_songs
    @songs.each { |song| puts song.name}
  end

  def self.all
    @@all
  end

end
