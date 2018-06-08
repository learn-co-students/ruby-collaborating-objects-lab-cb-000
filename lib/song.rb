require "pry"
class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def artist_name=(name)
    if (self.artist.nil?)
      self.artist= Artist.find_or_create_by_name(name)
    else
      self.artist.name = name
    end
    self.artist.save
  end

  def self.new_by_filename(file)
    song_name = file.split(" - ")[1]
    song_artist= file.split(" - ")[0]

    song = Song.new(song_name)
    song.artist_name= song_artist
    song.artist.add_song(song)
    song
  end
end
