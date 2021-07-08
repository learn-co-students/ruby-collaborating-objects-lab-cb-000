require "pry"

class MP3Importer
  attr_accessor :path
  
  def initialize(path)
    @path = path
    @files = Dir[path+"/*"].map {|file| file.split("\/").last}
  end

  def import
    @files.each do |file|
      Song.new_by_filename(file)
    end
  end

  def files
    @files
  end
  
end
