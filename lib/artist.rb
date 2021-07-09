class Artist
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def songs
    @songs
  end

  def print_songs
    @songs.each do |song_inst|
      puts song_inst.name
    end
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    artist = @@all.detect { |art_inst| art_inst.name == name }
    if artist.nil?
      artist = self.new(name)
      artist.save
    end
    artist
  end

end
