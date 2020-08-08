require 'pry'

class Artist

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

def self.all
  @@all
end

def add_song(song)
  song.artist = self
end

def songs
  all_songz = Song.all
  all_songz.select do |song|
    song.artist == self
  end
end

def self.find_or_create_by_name(new_name)
  result = @@all.detect do |artist|
    artist.name == new_name
  end
  result ? result : self.new(new_name)
end

def print_songs
  self.songs.each do |song|
    puts song.name
    # binding.pry
  end
end

end
