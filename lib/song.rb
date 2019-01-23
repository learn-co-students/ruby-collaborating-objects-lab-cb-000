class Song
    attr_accessor :name, :artist
    
      
    #The Song.new method listed below is initialized with an argument of a name
    #and pushes new instances into a class variable called @@all upon initialization. 
    #Note that the method is really listed as initialize instead of .new
    def initialize(name)
        @name = name
    
    end

    
    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
      end

    #This class method .new_by_filename reates a new instance of a song from the file
    #that's passed and associates a new song instance with the artist from the filename
    def self.new_by_filename(filename)
        artist, song = filename.split(" - ")
        new_song = self.new(song)
        new_song.artist_name = artist
        new_song
    end
    
  end
  