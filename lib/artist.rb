
class Artist

  attr_accessor :name, :songs

  @@all =[]

  def initialize(name)
    @name= name
    @songs = []
    @@all << self
  end

  def self.all
    @@all # to be able to use logic with @@all variable first define / expose the all class variable
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self unless @@all.include?(self)
  end

  #if find then return the name else create a new name
  def self.find_or_create_by_name(name)
      self.find(name) ? self.find(name) : self.create(name)
  end


  def self.find(name)
    self.all.find {|artist| artist.name == name }
  end


  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end

  def print_songs
    @songs.each do |song|
      puts song.name 
    end
  end
end
