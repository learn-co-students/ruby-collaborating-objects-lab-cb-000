class MP3Importer

  attr_reader :path

  def initialize(file_path)
    @path = file_path
  end

  def files
    Dir["#{@path}/*.mp3"].collect{|f| File.basename(f)}
  end

  def import
    self.files.each {|f| Song.new_by_filename(f)}
  end
end
