class MP3Importer
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    files = Dir["#{path}/*.mp3"]
    @files = files.collect { |x| x.gsub("#{path}/", "") }
  end

  def import
    files.each { |x| Song.new_by_filename(x) }
  end
end
