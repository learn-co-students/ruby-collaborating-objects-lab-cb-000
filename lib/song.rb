require 'pry'

class Song

  attr_accessor :name

  def initialize(name)
    #puts "creating new song instance"
    @name = name
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def self.new_by_filename(file_name)
    new_instance = Song.new(file_name.split(' - ')[1])
    puts file_name.split(' - ')[0]
    new_instance.artist = Artist.find_or_create_by_name(file_name.split(' - ')[0])
    new_instance
  end

end

#binding.pry