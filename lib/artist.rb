# artist
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

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    existing_artists = {}
    @@all.each do |artist|
      existing_artists[artist.name] = artist
    end

    if existing_artists.keys.include? name
      existing_artists[name]
    else
      artist = Artist.new(name)
      artist.save
      artist
    end
  end

  def print_songs
    songs.each { |song| puts song.name }
  end

  def add_song(song)
    @songs << song
  end
end
