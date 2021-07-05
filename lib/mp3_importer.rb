require 'pry'

class MP3Importer
  attr_accessor :path, :files

  def initialize(folder_path)
    @path = folder_path
    @files = []
  end

  # save an array of all mp3s files in the path
  def files
    # fetch the appropriate files
    file_paths = Dir.glob(@path + "/*.mp3")
    file_paths.map { |file_path| @files << File.basename(file_path) }
    @files
  end

  def import
    self.files.each { |filename| Song.new_by_filename(filename)}
  end
end
