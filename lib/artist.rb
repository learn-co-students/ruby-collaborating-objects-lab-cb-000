class Artist
  attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name
    @songs = []

  end

  def add_song(song)
    @songs << song
  end

  def self.new_by_filename(file)
    new_song = Song.new(file)
    @songs << new_song
  end

  def songs
    @songs
  end



def self.find_or_create_by_name(name)
    if self.find(name)
      self.find(name)
    else
      self.create(name)
    end
 end

def self.create(name)
  name = self.new(name)
  name.save
  name
end

def self.find(name)
  self.all.find {|object| object.name == name}
  
end
 def print_songs
    @songs.each do |song|
     puts "#{song.name}"
    end
 end

def save
  @@all << self
end

def self.all
  @@all
end

end
