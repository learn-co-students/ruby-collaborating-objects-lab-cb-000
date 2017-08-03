class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = [] # you want the songs array to be activated each time a new artist is created so that you can store their song
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def self.all #exposes the class variable
    @@all
  end

  def save # saves into the class variable array
    self.class.all << self
    self
  end

  def self.find_or_create_by_name(name)
    self.find(name) ?  self.find(name) : self.create(name)
  end

  def self.find(name)
    self.all.detect{|x| x.name == name}
  end

  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end

  def print_songs
    @songs.each do |x|
      puts x.name
    end
  end

end
