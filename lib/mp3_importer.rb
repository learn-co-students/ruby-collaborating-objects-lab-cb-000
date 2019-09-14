class MP3Importer
  attr_accessor :path, :files, :song, :artist

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir[@path + "/*.mp3"]
    file_no_path = @files.map { |file| File.basename(file) }
    @files = file_no_path
    @files
  end

  def import
    files = self.files
    songs = files.map { |file| Song.new_by_filename(file) }

  end

end
