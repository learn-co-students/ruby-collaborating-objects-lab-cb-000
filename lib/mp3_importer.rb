require 'pry'

class MP3Importer
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.entries(path)
    files.select { |file| file.end_with?(".mp3") }
  end

  def import
    files.each { |song| Song.new_by_filename(song)}
  end
end
