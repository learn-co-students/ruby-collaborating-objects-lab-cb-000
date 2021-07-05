require 'pry'
class MP3Importer

  attr_accessor :path, :files

  def initialize(file_path)
    @path = file_path
  end

  def files
    @files = Dir.entries(@path).select do |file_name|
      file_name.match(/\w+\.mp3/)
    end
  end

  def import
    self.files.each do |file_name|
      Song.new_by_filename(file_name)
    end
  end

end
