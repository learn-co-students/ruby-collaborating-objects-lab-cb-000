class MP3Importer
  require 'pry'
  attr_accessor :path

  def initialize(file_path)
    @path = file_path
    @files = []
    full_path = @path + "/*.mp3"
    full_file = Dir[full_path]
    full_file.each do |file|
      @files << file.split("#{@path}/")[1]
    end
  end

  def files
    return @files
  end

  def import
    @files.each do |filename|
      Song.new_by_filename(filename)
    end
  end

end
