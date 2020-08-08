 require 'pry'

class Song

  attr_accessor :name, :artist

@@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.new_by_filename(filename)
    artist, song = filename.split(" - ")
    new_song = self.new(song)
    new_song.artist_name = artist
    new_song
  end

  def self.all
    @@all
  end

  def artist_name=(name)
    result = Artist.find_or_create_by_name(name)
    self.artist = result
    # artist = Artist.new(name) if Artist
    # self.artist = @filename_song[0]
  end


  # def self.new_by_filename(filename)
  #   artist, song = filename.split(" - ")
  #   new_song = self.new(song)
  #   new_song.artist_name = artist
  #   new_song
  # end
  #
  # def artist_name=(name)
  #   self.artist = Artist.find_or_create_by_name(name)
  #   artist.add_song(self)
  # end


  # def self.find_or_create_by_name(name)
  #     self.find(name) ? self.find(name) : self.new(name)
  #   end
  #
  #   def self.find(name)
  #     self.all.find {|artist| artist.name == name }
  #   end
end
