class Artist
  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
  end

  def songs
    @songs
  end

  def print_songs
    songs.each {|x| puts x.name}
  end

  def self.find_or_create_by_name(name)
   #all.detect {|x| x.name = name}
   #name = Artist.new(name)
    if search_by_name(name) == nil
     create_by_name(name)
   elsif search_by_name(name) != nil
     self.name
    end
  end

  def self.create_by_name(name)
    name = self.new(name)
    name.save
  end

  def self.search_by_name(name)
    self.all.detect{|x| x = name}
  end

  def save
    @@all << self
  end
end
