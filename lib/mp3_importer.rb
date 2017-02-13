class MP3Importer
  attr_reader :path

  def initialize(path_to_files)
    @path = path_to_files
  end

  def files
    @files ||= Dir["#{@path}/*.mp3"].collect{|f| f.gsub("#{@path}/","")}
  end

  def import
    files.each{|f| Song.new_by_filename(f)}
  end

end
