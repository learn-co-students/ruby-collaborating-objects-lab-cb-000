class Artist

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
  end

  def songs
    @songs
  end

  def print_songs
    @songs.each { |s| puts s.name }
  end

  def self.find_or_create_by_name(artist_name)
    artist = all.detect{|a|a.name == artist_name}
    artist = Artist.new(artist_name) if artist.nil?
    artist
  end

end
