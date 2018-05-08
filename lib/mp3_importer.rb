class MP3Importer
  attr_accessor :path
@@files = []

#Sets path variable
  def initialize(path)
    @path = path
  end

#Shovels filenames into array
  def files
    files = []
    Dir.new(path).each do |file|
      files << file if file.include?(".mp3")
    end
    files
  end

#Goes through imported files and creates new songs
  def import
    self.files.each do |filename|
      Song.new_by_filename(filename)
    end
  end

end
