#require_relative './song.rb'
#require_relative './mp3_importer.rb'
class Artist
  attr_accessor :name, :songs
  @@all = []
  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end
  def add_song(track)
    @songs << track
  end
  def save
    @@all << self
  end
  def self.find_or_create_by_name(name)
    dex = nil
    @@all.each do |artist|
      if artist.name == name
        dex = artist
      end
    end
    if dex == nil
      dude = Artist.new(name)
      dude.name = name
      @@all << dude
      dex = dude
    end
    return dex
  end
  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end

end
