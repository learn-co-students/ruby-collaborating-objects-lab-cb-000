class Artist
  attr_accessor :name
  attr_reader :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(artist)
    @@all.each do |x|
      if x.name == artist #if artist is found within class variable @@all
        return x #return that instance of Artist
      end
    end
    #will only execute if artist is not already in class variable @@all
    new_artist = Artist.new(artist)
    @@all << new_artist
    new_artist    
  end

  def print_songs
    arr = []
    @songs.each do |x|
      puts x.name
    end
    
  end
      
  
end