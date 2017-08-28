class MP3Importer
  attr_reader :path, :files

  def initialize(path)
    @path = path
  end

  def files
    entries = Dir.entries(@path)
    entries.select{|i| i[/\.mp3$/]}
  end

  def import
    self.files.each do |filename|
      Song.new_by_filename(filename)
    end
  end
end
