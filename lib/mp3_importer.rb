class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).select {|f| f[-4..-1] == ".mp3"}
  end

  def import
    files.each do |file|
      puts file
      Song.new_by_filename(file)
    end
  end

end