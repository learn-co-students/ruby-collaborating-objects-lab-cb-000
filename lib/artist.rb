class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    artist = @@all.select { |e| e.name == name }
    if artist == []
      artist = Artist.new(name)
      return artist
    else
      return artist[0]
    end
  end

  def print_songs
    @songs.each { |song| puts song.name }
  end


end
