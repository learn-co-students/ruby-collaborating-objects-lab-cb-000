class MP3Importer
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).select {|f| !File.directory? f}
  end

 def import
   files.select { |file| Song.new_by_filename(file) }
 end

end
