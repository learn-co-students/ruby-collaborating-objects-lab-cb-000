class MP3Importer
  attr_accessor :path, :filenames

  def initialize(path)
    @path = path
    @filenames = []
  end

  def files
    Dir.children(path).each {|file| @filenames << file }
  end

  def import
    self.files
    @filenames.each do |file|
      song = file.split(" - ")[1]
      Song.new_by_filename(song)
  end
end

end
