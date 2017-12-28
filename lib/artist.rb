class Artist
  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end


  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
    if @@all.include?
      --
    else
      song = Song.new(name)
      @songs << song
      song
    end
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end

end
