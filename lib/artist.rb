class Artist
  @@song_count = 0
  @@all = []

  attr_accessor :name, :all

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def add_song(song)
    @songs << song
    song.artist = self
    @@song_count += 1
  end

  def save
    self.class.all << self
  end

  def songs
    @songs
  end

  def add_song_by_name(name)
    song = Song.new(name)
    add_song(song)
  end

  def self.song_count
    @@song_count
  end



end
