class Artist
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def name=(name)
    @name = name
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end
  #artist =  self.new(name)
  #artist.save
  #artist

  def self.find_or_create_by_name(name)
    self.all.find {|artist| artist.name == name} || self.create(name)
  end

  def print_songs
    songs.each do |song|
    puts song.name
  end
  end

end
