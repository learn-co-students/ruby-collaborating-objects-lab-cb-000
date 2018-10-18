class Artist 
  attr_accessor :name, :songs 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  def self.all 
    @@all 
  end
  
  def self.find_or_create_by_name(name)
    the_artist = all.find { |artist| artist.name == name }
    return the_artist unless the_artist.nil?
    
    self.new(name).save
  end 
  
  def add_song(song)
    songs << song
  end 
  
  def save
    @@all << self 
    self
  end
  
  def print_songs
    puts songs
  end
end