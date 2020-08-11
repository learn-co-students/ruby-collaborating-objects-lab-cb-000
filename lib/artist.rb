class Artist 
  attr_accessor :name, :songs
  
  @@all = []
  
  def self.all 
    @@all 
  end 
  
  def initialize(name)
    @name = name 
    self.class.all << self 
  end 
  
  def add_song(song)
    song.artist = self 
  end 
  
  def songs 
    Song.all.select {|song| song.artist == self} 
  end 
  
  def self.find_or_create_by_name(name)
    if self.all.detect {|song| song.name == name}.nil?
      Artist.new(name)
    else 
      self.all.detect {|song| song.name == name} 
    end 
  end 
  
  def print_songs 
    self.songs.each {|song| puts song.name }
  end 
  
end 