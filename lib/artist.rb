class Artist

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    # @all = []
  end

  def self.find_or_create_by_name(name)
    art = @@all.find { |artist| artist.name == name }
    if art == nil
      new_artist = Artist.new(name)
      new_artist.save
      new_artist
    else
      art
    end
  end

  def name=(name)
    @name = name
  end

  def save
    @@all << self
  end

  def add_song(song)
    @songs << song
  end


  def songs
    @songs
  end

  def self.all
    @@all
  end

  def print_songs
    @songs.each { |song| puts song.name }
  end

end
