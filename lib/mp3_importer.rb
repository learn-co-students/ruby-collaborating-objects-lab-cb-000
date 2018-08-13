require 'pry'

class MP3Importer
  attr_accessor :files, :path

  def initialize(path)
    @path = path
    @files = Dir.glob("#{path}/*.mp3")
    @files.each do |file|
      file.slice!("#{path}/")
    end
  end

  def import
    @files.each do |file|
      Song.new_by_filename(file)
    end
  end
end
