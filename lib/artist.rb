class Artist
  attr_accessor :name, :songs
  @@all = []


  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def save
    @@all << self
  end

  def add_song(song)
    @songs << song
  end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end

  def self.find_or_create_by_name(name)
    result = nil
    @@all.each do |artist|
      if artist.name == name
        result = artist
      end
    end
    if result != nil
      return result
    else
      artist = Artist.new(name)
      return artist
    end
  end

  def self.all
    @@all
  end

end
