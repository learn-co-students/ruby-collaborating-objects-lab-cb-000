class MP3Importer
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    file_list = Dir[path + "/*.mp3"]

    @files = file_list.collect { |file| file.split("/").last }
  end

  def import
    file_list = self.files
    file_list.each do |file|
      Song.new_by_filename(file)
    end
  end

end
