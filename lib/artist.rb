class Artist

    attr_accessor :name, :songs

    @@all = [] #an array of Artists

     def initialize(name)
      #Every artist has a song array
      #however, we may not have a song objects
      #yet
      @songs = []
      if (name)
        @name = name
      end
      #add artist to Artist array
      save
    end

    def self.find_by_name(nameStr)
        #return the Artist object where Artist.name == nameStr
        tmpArr = []
        #select returns an array of matching objects
        #or returns nil if no object found
        tmpArr = @@all.select{ |a| a.name == nameStr}
        #return an object or nil
        tmpArr.first
    end

    def self.find_or_create_by_name(name)

      #receives a string
      #searches existing artists and
      #returns the artist whose name
      #matches the incoming string
      retObj = self.find_by_name(name);
      if retObj.nil?
        #artist not found, create new artists

        newArtist = Artist.new(name)
        #return the new object
        retObj = newArtist
      else
        #return the object from the array returned
        #in our select statement
        retObj
      end
    end

    def add_song(songObj)
        #add the song to this artist
        @songs << songObj
    end

    def self.all
      @@all
    end

    def save
        @@all << self
    end

    def print_songs

       for i in 0 .. @songs.size - 1 do
            puts("#{@songs[i].name}\n")
        end
    end

end
