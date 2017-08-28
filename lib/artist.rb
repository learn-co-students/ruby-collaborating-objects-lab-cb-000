class Artist
  attr_accessor :name
  @@all = []

  ###########CLASS METHODS############


  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end


  def self.find_or_create_by_name(name)
      @@all.each do |artist|
        if artist.name == name
          return artist
      end
    end

    artist = Artist.new(name)
    artist.save
    artist
  end

##########INSTANCE METHODS##########

  def add_song(song)
    @songs << song
  end

  def songs
    @songs
  end

  def save
    @@all << self
  end

  def name
    @name
  end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end
end
