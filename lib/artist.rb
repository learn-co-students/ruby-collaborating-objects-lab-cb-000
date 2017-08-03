class Artist
  attr_accessor :name, :songs
  @@all = []

  def self.all
    @@all
  end

  def initialize (name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(artName)
    artist = self.new(artName)
    if self.all.any?{|songWriter| songWriter.name == artName}
      self.all.detect{|artist| artist.name == artName}
    else
      artist.save
      artist
    end
  end

  def print_songs
    self.songs.each {|song| puts song.name}
  end
end
