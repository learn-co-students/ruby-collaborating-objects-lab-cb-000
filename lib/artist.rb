class Artist
  attr_reader :songs
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    if @songs.include?(song.name)
      puts "#{song.name} already part of #{@name}'s songs list."
    else
      @songs << song
      song.artist = self
    end
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.find_by_name(name)
    self.all.detect {|a| a.name == name}
  end

  def self.create_by_name(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def self.create_from_filename(filename)
    artist, title, genre = filename.split('.').first.split(' - ')
    artist = self.create_by_artist_title_genre(artist, title, genre)
  end

  def self.create_by_artist_title_genre(name, title, genre)
    artist = Artist.find_or_create_by_name(name)
    song = Song.new(title)
    song.genre = genre
    artist.add_song(song)
    artist
  end

  def print_songs
    songs.each do |s|
      puts s.name
    end
  end

end
