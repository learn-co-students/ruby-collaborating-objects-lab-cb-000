class Artist

@@all = []

attr_accessor :name, :songs

def initialize(name)
  @name = name
  @songs = []
  self.save
end

def self.all
  @@all
end

def add_song(title)
  @songs << title
end

def self.find_or_create_by_name(name)
    if @@all.detect {|artist| artist.name == name} == nil
      self.new(name)
    else
      @@all.detect {|artist| artist.name == name}
    end
  end

def save
  @@all << self
end

def print_songs
  songs.each do |i|
    puts i.name
  end
end

end
