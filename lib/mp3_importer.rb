class MP3Importer
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    files = Dir["#{@path}/*.mp3"]
    @files = files.map {|file|
      str = file.split(@path + "/")
      str[1]
    }
  end

  def import
    files
    @files.each { |file|
      Song.new_by_filename(file)
    }
  end

end
