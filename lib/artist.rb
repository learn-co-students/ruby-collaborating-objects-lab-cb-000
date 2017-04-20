#require 'pry'

class Artist
  @@all = []
  attr_accessor :name
  attr_reader :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song unless @songs.any? {|s| s.name == song.name}
  end

  def self.create_by_name(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find {|artist| artist.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create_by_name(name)
  end

  def print_songs
    @songs.each { |song| puts "#{song.name}" }
  end

end

##for debug
#artist_1 = Artist.find_or_create_by_name("Drake")
#binding.pry
#puts "debug"
