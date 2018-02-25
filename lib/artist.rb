require 'pry'

class Artist

attr_accessor :name, :songs

@@all = []

def initialize(name)
  @name = name
  @songs = []
end

def add_song(x)
  @songs << x
end

def self.all
  @@all
end

def save
  @@all << self
end

def self.find_or_create_by_name(x)
		@@all.any? {|i| i.name == x} ? x : Artist.new(x)
end

def print_songs
  @songs.each {|i| puts i.name}
end

end
