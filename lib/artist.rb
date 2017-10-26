class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @songs = []
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    Artist.all.each do |artist|
      if artist.name == name
        return artist
      end
    end
    artist = self.new(name)
    artist
  end

  def add_song(song)
    self.songs << song
  end

  def save
    @@all << self
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end
end
