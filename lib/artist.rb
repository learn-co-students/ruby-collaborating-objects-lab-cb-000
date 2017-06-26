class Artist

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def save
    @@all << self
  end

  def add_song(song)
    @songs << song
  end


  def self.find_or_create_by_name(artist_name)
    if @@all.any?{ |artist| artist.name == artist_name }
      #puts "found artist, giving you the existing one"
      return @@all.find{ |artist| artist.name == artist_name }
    else
      #puts "artist not found, creating"
      artist = Artist.new(artist_name)
      artist.save
      return artist
    end
  end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end

  def self.all
    @@all
  end

end
