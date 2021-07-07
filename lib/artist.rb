class Artist
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def songs
    return @songs
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
    @@all.each do |artist|
      return artist if artist.name == name
    end
    new_artist = self.new(name)
    @@all << new_artist
    return new_artist
  end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end

  def self.all
    return @@all
  end

end
