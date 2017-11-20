class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def name=(name)
    @name = name
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

  def self.find_by_name(artist_name)
    self.all.detect{|artist| artist.name == artist_name}
  end

  def self.find_or_create_by_name(artist_name)
    if self.find_by_name(artist_name)
      self.find_by_name(artist_name)
    else
      Artist.new(artist_name)
   end
  end

  def print_songs
      self.songs.each do |song|
        puts song.name
      end
    end
end
