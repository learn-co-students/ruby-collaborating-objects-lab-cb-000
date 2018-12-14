require_relative "./artist.rb"
#require_relative "./mp3_importer.rb"
class Song
  attr_accessor :name, :artist, :genre
  def initialize(name)
    @name = name
  end
  def self.new_by_filename(filename)
    ray = filename.split(" - ")
    track = Song.new(ray[1])
    creator = Artist.find_or_create_by_name(ray[0])
    track.artist = creator
    creator.add_song(track)
    track.genre = ray[2]
    return track
  end
end
