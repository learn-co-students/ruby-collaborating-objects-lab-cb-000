require 'pry'
class MP3Importer
  @@songs_imported = []
  attr_accessor :path, :filenames

  def initialize(path)
    @path = path
    @filenames = []
  end

  def self.all
    @@songs_imported
  end

  def files
    Dir.foreach(self.path) { |i|
      @filenames << i if i[".mp3"] == ".mp3"
    }
    @filenames
  end

  def import
    
    self.files.each {|i| Song.new_by_filename(i)}
  end

end
