class MP3Importer
  attr_accessor :path, :file, :filename

  @@file = []

  def initialize(path)
    @path = path
  end

  def files
    @@file = Dir.entries(path)
    @@file.delete(".")
    @@file.delete("..")
    @@file
  end

  def import
    files.each do |file_name|
      Song.new_by_filename(file_name)
    end
  end

end
