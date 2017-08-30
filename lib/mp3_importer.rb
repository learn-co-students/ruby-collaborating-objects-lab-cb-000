class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
    a = Dir[path+"/*.mp3"]
  end

  def import
    files.each do |f|
      Song.new_by_filename(f)
    end
  end

  def files
    Dir[@path+"/*.mp3"].map{ |f| File.basename f }
  end
end
