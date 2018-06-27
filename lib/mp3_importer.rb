class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(@path).select {|filename| !File.directory?(filename) && filename.end_with?(".mp3")}
  end

  def import
    files.each {|track| Song.new_by_filename(track)}
  end

end
