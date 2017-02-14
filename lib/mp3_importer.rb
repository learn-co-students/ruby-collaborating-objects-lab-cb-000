require 'pry'
class MP3Importer
  attr_reader :path

  def initialize(path) #=> Acceps a file path to parse mp3 files from.
    @path = path
  end

  def files #=> selects all .mp3 files from the @path directory.
    Dir.entries(@path).select {|file| file.end_with?(".mp3")}
  end

  def import
    files.each{|file| Song.new_by_filename(file)}
  end
end
