class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    Dir.entries(@path).each {|file| @files << file if file[-4..-1] == '.mp3'}
    @files
  end

  def import
    self.files
    @files.each {|file| Song.new_by_filename(file)}
  end

end
