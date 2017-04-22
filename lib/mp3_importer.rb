require 'pry'

class MP3Importer
  attr_accessor :path


  def initialize(file_path)
    @path = file_path
  end

  def files
    # loads all the mp3 files in the path directory / removes the route path gives just the song info
    Dir["./spec/fixtures/mp3s/*"].map {|x| File.basename(x)}
  end

  def import
    self.files.each{|filename|Song.new_by_filename(filename)}
  end

  def size
    self.files.size? #gives number of files in file method
  end

end
