class Artist
  attr_accessor :name, :songs
  @@all = Array.new

  def initialize(name)
    @name = name
    @songs = Array.new
  end

  def add_song(song)
    @songs << song
    @songs.uniq
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    artist = @@all.find{ |artist| artist.name == name}
      if artist.nil?
        artist = self.new(name)
      end
      artist
  end

  def print_songs
    puts self.songs.map{|song| song.name}
  end
end
