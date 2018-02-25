require 'pry'
class MP3Importer

  attr_accessor :path, :filenames

  @@all = []

  def initialize(path)
    @path = path
  end

  def files
    @filenames = Dir.entries(@path)
    @filenames.grep(/mp3/)
  end

  def import
    files.each {|file| @@all << Song.new_by_filename(file) }
  end

end
