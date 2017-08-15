class Artist
#The Artist class will be responsible for either creating the artist (if the artist doesn't exist in our program yet) or finding the instance of that artist (if the artist does exist).
attr_accessor :name, :songs
@@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def add_song(song)
    self.songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end


  def self.find_or_create_by_name(name)
    #This class method should take the name that is passed in (remember, it will be a string), and do one of two things.
    #Find the artist instance that has that name or create one if it doesn't exist.
    #Either way, the return value of the method will be an instance of an artist with the name attribute filled out.
    # @@all.include?(name) ? artist = @all.detect(name) : artist = Artist.new(name)
    artist = @@all.detect {|i| i.name == name}
    !artist ? artist = Artist.new(name) : nil
    artist
  end

  def print_songs
    self.songs.each do |song|
      puts song.name
    end
  end
end
