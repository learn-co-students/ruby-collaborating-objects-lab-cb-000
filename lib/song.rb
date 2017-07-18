require 'pry'
require_relative './artist.rb'

class Song    
    attr_accessor :name, :artist

    def initialize(name)
        @name = name
    end

    def self.new_by_filename(filename)
        artist_name, song_name = filename.split(' - ')
        
        # create the song
        song = self.new(song_name)

        # create the artist if it does not exist
        artist = Artist.find_or_create_by_name(artist_name)

        # song 'belongs to' the artist
        song.artist = artist
        
        # artist 'has many' songs
        artist.add_song(song)

        song
    end
end


# binding.pry