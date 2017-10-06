require "pry"
class Artist
  attr_accessor :name, :all
  @@songs = []
  @@all = []

  def initialize(artist_name)
    @name = artist_name
  end

  def songs
    @@songs
  end

  def add_song(song_name)
    @@songs << song_name
  end

  def save
    artist = Artist.new(artist)
    @@all << artist
    #binding.pry
  end

  def self.find_or_create_by_name(artist)
    return_value = 0
    @@all.each do |artists|
      if artists.name == artist
          return_value = artists
      else
        new_artist = Artist.new(artist)
          return_value = new_artist
      end
    end
    return_value
  end

  def add_song(song)
    @@songs << song
  end

  def print_songs
    @@songs
  end
end
