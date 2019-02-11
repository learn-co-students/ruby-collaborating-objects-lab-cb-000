class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Array.new
    Dir.new(".")
    Dir.foreach(@path){ |file| files << file if file.match(/.mp3\z/)  }
    files
  end

  def import
    self.files.each{ |file| Song.new_by_filename}
  end
end
