class MP3Importer
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = self.files
  end

  def files
    @files = Dir.entries(@path)
    @files.shift(2)
    @files
  end

  def import
    @files.each do |file|
      Song.new_by_filename(file)
    end
  end
end
