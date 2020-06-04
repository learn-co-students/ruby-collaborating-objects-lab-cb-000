require 'pry'
class Song

  attr_accessor :name, :artist
  @@all = []

    def initialize (name)
      @name = name
      @@all << self
    end

    def self.all
      @@all
    end

    def self.new_by_filename(file_name)
      artist = file_name.split(" - ")[0]
      name = file_name.split(" - ")[1]
      #binding.pry
      song = self.new(name)
      song.artist_name = artist
      song
    end


    def artist_name=(name)
      self.artist = Artist.find_or_create_by_name(name)
      artist.add_song(self)
    end
  end
