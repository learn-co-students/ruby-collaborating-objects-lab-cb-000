require 'pry'
class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    filename = Dir.entries(@path)
    #binding.pry
    filename.delete(".")
    filename.delete("..")
    filename
  end

  def import
    filename = Dir.entries(@path)
    #binding.pry
    filename.delete(".")
    filename.delete("..")
    filename.delete(".mp3")
    filename.each do |song|
      #binding.pry
      song_1 = Song.new_by_filename(song)
    end
  end
end
