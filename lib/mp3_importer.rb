require 'pry'
class MP3Importer
  attr_accessor :path

  def initialize(file_path)
    @path = file_path
    @files = []
  end

  def files
    file_names = Dir.glob("#{path}/*.mp3")
    @files = file_names.collect do |file|
      File.basename file
    end
  end

  def import
    self.files.each do|file_name|
      Song.new_by_filename(file_name)
    end
  end

end
