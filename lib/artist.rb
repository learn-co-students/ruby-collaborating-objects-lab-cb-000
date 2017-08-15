class Artist
  @@all = Array.new
  attr_accessor :name
  attr_reader :songs

  def self.all()
    return @@all
  end

  def self.find_or_create_by_name(name)
    returned_artist = Artist.all.detect{|artist| artist.name == name}
    if returned_artist == nil
      returned_artist = Artist.new(name)
    end
    return returned_artist
  end

  def initialize(name)
    self.name = name
    @songs = Array.new
    self.save
  end

  def add_song(song)
    self.songs << song
  end

  # specification requires that this be a separate method instead of
  #   being directly coded into #initialize
  def save()
    @@all << self
  end

  def print_songs()
    self.songs.each{|song| puts song.name}
  end
end
