require 'pry'

class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def artist=(artist)
    @artist = artist
  end

  def self.new_by_filename(x)
    a = x.split(" - ")
    b = Song.new(a[1])
    b.artist = Artist.find_or_create_by_name(a[0])
    b
  end

end
