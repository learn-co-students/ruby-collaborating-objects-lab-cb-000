class Artist

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def songs
    @songs
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    if @@all.detect{|artist| artist.name == name}.nil?
      returned_artist = Artist.new(name)
    else
      returned_artist = @@all.detect{|artist| artist.name == name}
    end
    returned_artist  
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end

end