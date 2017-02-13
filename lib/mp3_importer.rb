require 'pry'
class MP3Importer
  attr_reader :path

  def initialize(path_to_files)
    @path = path_to_files
  end

  def files
    Dir.entries(path).select {|file| file.end_with?(".mp3")}
  end

  def import
    #binding.pry
    files.each{|file| Song.new_by_filename(file)}
  end

end
