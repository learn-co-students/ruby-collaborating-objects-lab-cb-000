class Song

    attr_accessor :name, :artist

    @@all = []

    def self.new_by_filename(filename)
        #split the filename into artist and song name
        #filename coming in as "Real Estate - Green Aisles - country.mp3"
        # or artist, song, and genre
        tmpArr = filename.split(" - ")
        artistName = tmpArr[0]
        songName = tmpArr[1]
        #genre = tmpArr[2] #not using

        #create and return the new song instance
        song = self.new(songName, artistName)

  end

  def initialize(name, artist="")
    @name = name
    if (artist)
      @artist = Artist.find_or_create_by_name(artist)
    end
    @artist.add_song(self)
    #add ourselves to all songs
    @@all << self


  end

    def print_all_artists
      puts("============================================================\n")
      puts("==========CONTENTS OF ALL ARTISTS ==========================\n")
      allArr = Artist.all
      for i in 0 .. Artist.all.size - 1
        puts("Artist:  #{allArr[i].name}")
      end
      puts("============================================================\n")
    end

    def print_all_songs
      puts("============================================================\n")
      puts("==========CONTENTS OF ALL SONGS=============================\n")

      for i in 0 .. @@all.size - 1 do
        puts("Song Name:  #{@@all[i].name}\n")
        puts("Artist:  #{@@all[i].artist.name}\n")
      end
      puts("============================================================\n")
    end

    def self.all
        @@all
    end


    def artist_name=(name)
        @artist = Artist.find_or_create_by_name(name)
    end

end
