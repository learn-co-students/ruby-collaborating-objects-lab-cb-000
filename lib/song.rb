class Song
    attr_accessor :name
    def initialize(name)
        @name = name
        @artist = nil
    end
    def artist=(artist_variable)
        @artist = artist_variable
        artist_variable.add_song(self)
    end
    def artist
        @artist
    end
    def self.new_by_filename(filename)
        unique = true
        split_array = filename.split(" - ")
        new_song_variable = Song.new(split_array[1].split(".mp")[0])
        Artist.all.each do |test_artist|
            if test_artist.name == split_array[0]
                new_song_variable.artist = test_artist
                unique = false
            end
        end
        if unique == true
            new_artist_variable = Artist.new(split_array[0])
            new_song_variable.artist = new_artist_variable
            new_artist_variable.save
        end
        new_song_variable
    end
end
