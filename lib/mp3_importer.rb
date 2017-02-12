class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def import
    files.each { |mp3| Artist.create_from_filename(mp3)}
  end

  def files
    list = Dir[path + "/*.mp3"]
    @files = list.collect { |file| file.split("/").last }
  end

end