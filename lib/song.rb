require 'pry'

class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    song = Song.new(filename.sub(/.*\/+/, '').split(" - ")[1])
    song.artist = Artist.new(filename.sub(/.*\/+/, '').split(" - ").first)
    song
  end
end
