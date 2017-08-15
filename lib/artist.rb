
class Artist

  attr_accessor :name, :genre, :songs
  @@song_count = 0
  @@all = []
  def initialize(name = nil)
    @name = name
    @songs = []

  end
  def self.find_or_create_by_name(artist_name)
    if @@all.any? { |artist| artist.name == artist_name }
        @@all.find { |artist| artist.name == artist_name }
    else
      new_artist = Artist.new(artist_name)
      new_artist.save
      new_artist
    end
  end
  def print_songs

    @songs.each {|s| puts s.name}

  end
  def self.all
    @@all.uniq
  end
  def save
    @@all << self

  end

  def add_song(song)
    song.artist = self
    @songs << song
    @@song_count += 1

  end

  def add_song_by_name(name)
    song = Song.new(name)
    song.artist = self
    @songs << song
    @@song_count += 1

  end

  def self.song_count
    @@song_count
  end


end
