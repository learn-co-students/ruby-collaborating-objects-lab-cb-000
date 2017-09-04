class Artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end

  def print_songs
    @songs.each{ |song|
    puts song.name}
  end

  def self.all
    return @@all
  end

  def self.find_or_create_by_name(name)

    result = all.select {|art| art.name == name}
    if result == []
      result = self.new(name)
    else
      result = result.first
    end

    return result
  end

end
