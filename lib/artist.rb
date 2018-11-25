class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

  def self.all
    return @@all
  end

  def self.find_or_create_by_name(name)
    if @@all.any?{|artist| artist.name == name}
      return @@all.find{|artist| artist.name == name}
    else
      return self.new(name)
    end
  end

  def print_songs
    return @songs.each{|song| puts song.name}
  end
end
