class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def save
    @@all << self
    @@all.uniq!
  end

  def self.find_or_create_by_name(artist)
    @@all.find {|s| s.name == artist } || Artist.new(artist)
  end

  def print_songs
    self.songs.each {|x| puts x.name}
  end
end
