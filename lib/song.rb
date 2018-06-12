require_relative 'artist'

class Song

    attr_accessor :name, :artist

    def initialize(name)
        @name = name
    end

    def self.new_by_filename(file_name)
        song_data = file_name.split(" - ")
        song_artist = song_data[0]
        song_title = song_data[1]

        new_song = Song.new(song_title)
        new_artist = Artist.find_or_create_by_name(song_artist)
        new_artist.add_song(new_song)
        new_song.artist = new_artist
        return new_song
    end
end
