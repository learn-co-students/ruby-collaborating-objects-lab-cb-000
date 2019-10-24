require "pry"

class MP3Importer
  attr_accessor :path
  def initialize(file_path)
    @path=file_path
  end

  def files
    Dir["#{@path}/*.mp3"].collect do |file|
      file.split("/")[4]
    end
  end

  def import
    self.files.each {|file| Song.new_by_filename(file)}
  end
end
