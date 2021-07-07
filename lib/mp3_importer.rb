class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    @files = Dir[@path + "/*.mp3"].collect{|f| f.gsub("#{path}/", "")}
  end

  def import
    files.each do |x|
      Song.new_by_filename(x)
    end
  end
end
