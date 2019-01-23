class Artist
    attr_accessor :name, :songs
  
    @@all = [ ]

    def initialize(name)
      @name = name
      @songs = [ ]
    end


    def self.all
      @@all
    end
    
    def save
      @@all << self
    end

    #The class method .find_or_create_by_name finds or creates an artist by name 
    #maintaining uniqueness of objects by name property and Creates new instance of
    #Artist if none exist. This actually incorporates two other class methods
    #.find and .create
    def self.find_or_create_by_name(name)
      self.find(name) ? self.find(name) : self.create(name)
    end

    def self.find(name)
      self.all.find {|artist| artist.name == name }
    end


    def self.create(name)
     self.new(name).tap {|artist| artist.save}
    end

    #Here, we iterate through the array of songs and have each one printed by 
    #calling the .name method on the song. This way we don't get an object ID
    def print_songs
      songs.each {|song| puts song.name}
    end

    #The add_song method takes in an argument of a song and associates that song with the artist by 
    #telling the song that it belongs to that artist
    def add_song(song)
      @songs << song
    end
    
    
      
end