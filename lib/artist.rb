class Artist

  attr_accessor :name, :songs

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

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)

    if @@all.find {|artist| artist.name == name}
      return @@all.find {|artist| artist.name == name}
    else
      new_artist = Artist.new(name)
      new_artist.save
      return new_artist
    end
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end

end
