class Artist

  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def print_songs
    #wants ush to display song name to terminal
    @songs.each {|song| puts song.name}
  end

  def add_song(song)
    @songs << song
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    #easier if we break it up into two methods cause if not result methods return nil
    #guess you could do it with ifs if you changed detect to any? so it gives you a boolean
    self.find(name) ? self.find(name) : self.create(name)
  end

  def self.create(name)
    #could do this in one step with self.new(name).tap{|song| song.save}
    art = self.new(name)
    art.save
    art
  end

  def self.find(name)
    #same as @@all.find{}
    @@all.detect{|artist| artist.name == name}
  end



end
