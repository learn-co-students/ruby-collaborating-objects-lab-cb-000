require 'pry'

class MP3Importer

  attr_accessor :files, :music_path, :songs, :path

  def initialize(music_path)
    @path = music_path
    @files = []
    Dir.foreach(music_path) {|file_name| @files << file_name unless file_name.length < 5 }
  end

  def import
    @files.each {|file_name| Song.new_by_filename(file_name)}
  end

end
