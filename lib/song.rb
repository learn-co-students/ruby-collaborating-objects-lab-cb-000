require 'pry'
class Song

  @@all = []

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
    @@all << self
  end

  def artist
    @artist
  end

  def self.all
    @@all
  end

  def self.new_by_filename(filename)

    song_name = filename.split('-')[1].strip
    artist_name = filename.split('-')[0].strip

    song = Song.new(song_name)
    artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(song)
    song
  end

end
