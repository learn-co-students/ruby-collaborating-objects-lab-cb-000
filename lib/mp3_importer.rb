class MP3Importer

attr_reader :path

  def initialize(path) #accepts a file path to parse mp3 files from
    @path = path
  end

  def files
    files = Dir.entries(path)
    files.delete_if do |file| 
      file == ".." || file =="."
    end
  end

  # imports the files into the library by creating songs from a filename
  def import
    files.each {|file_name| Song.new_by_filename(file_name)}
  end


end
