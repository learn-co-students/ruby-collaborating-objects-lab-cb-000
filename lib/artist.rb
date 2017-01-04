class Artist
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def name=(name)
    @name = name
  end

  def add_song(song)
    @songs << song
  end

  def songs
    @songs
  end

  def print_songs
    @songs.each {|x| puts x.name}
  end

  def save
    self.class.all << self
  end

  def self.find_or_create_by_name(name)
    found = self.all.find {|x| x.name == name}
    if !found
      found = Artist.new(name)
      self.all << found
    end
    found
  end

  def self.all
    @@all
  end

end
