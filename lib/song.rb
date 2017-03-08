require "pry"
class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  # def self.new_by_filename(filename)
  #   song_name = filename.scan(/(\w+\s\w+\s?\w+)/)[1][0]
  #   song_artist = filename.scan(/^(\w+\s?\w+)/)[0][0]
  #   new_song = self.new(song_name)
  #   new_song.artist_name = song_artist
  #     # binding.pry
  # end

  def self.new_by_filename(filename)
    artist, song = filename.split(" - ") # => this is a really cool trick
    new_song = self.new(song)
    new_song.artist_name = artist
    new_song
    # binding.pry
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

end
