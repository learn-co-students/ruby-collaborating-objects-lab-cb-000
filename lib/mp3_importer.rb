require 'pry'
# Mp3_Importer class
class MP3Importer
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir["#{@path}/*.mp3"].each { |file| file.slice! "#{@path}/" }
  end

  def import
    files.each { |file| Song.new_by_filename(file) }
  end
end
