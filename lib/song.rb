require 'pry'
class Song

    attr_accessor :name, :artist, :genre

    def initialize(name)
      @name = name
    end

    def artist=(name)
      @artist = name
    end

    def artist_name=(name)
      self.artist = Artist.find_or_create_by_name(name)
      artist.add_song(self.name)
    end

    def self.new_by_filename(filename)
      filename = filename.chomp(".mp3")
      file_arr = filename.split(" - ")

      song = self.new(file_arr[1])
      song.artist_name = file_arr[0]
      song
    end


end
