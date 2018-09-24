class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir[self.path + "/**/*"].collect{|filename| filename.split("\/")[-1]}
  end

  def import
    self.files.each{|filename| Song.new_by_filename(filename)}
  end

end
