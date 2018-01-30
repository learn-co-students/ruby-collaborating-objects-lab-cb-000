require "pry"

class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    @files = Dir["#{@path}/*.mp3"]
    @files.collect { |e| e.slice(@path.length+1..-1)}
  end

  def import
    files.each { |e| Song.new_by_filename(e) }
  end

end
