class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir["#{@path}/*.mp3"].collect do |file_with_path|
      File.basename(file_with_path)
    end
  end

  def import
    self.files.each do |file|
      Song.new_by_filename(file)
    end
  end

end
