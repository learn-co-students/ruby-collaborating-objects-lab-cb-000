class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    arr = []
    Dir.entries(path).each do |x|
      if x.include?(".mp3")
        arr << x
      end
    end
    arr
  end

  def import
    self.files.each do |x|
      Song.new_by_filename(x)
    end
  end
end