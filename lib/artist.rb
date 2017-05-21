class Artist

  attr_accessor :name, :songs

  @@song_count = 0
  @@all = []
  def initialize name
    self.name = name
    self.songs = []
    save
  end

  def add_song song
    self.songs << song
    song.artist = self
    @@song_count += 1
  end

  def add_song_by_name song_name
    song = Song.new song_name
    add_song song
  end

  def self.song_count
    @@song_count
  end

  def self.find_or_create_by_name name
    @@all.find { |x| x.name == name } || Artist.new(name)
  end

  def print_songs
     songs.each { |song| puts song.name }
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end
end
