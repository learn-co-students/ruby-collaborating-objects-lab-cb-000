class MP3Importer
  attr_accessor :path, :files

  def initialize(file_path)
    @path = file_path
    @files = Dir.entries(@path).select{|file| file.include?(".mp3")}
  end
  def import
    @files.each{ |song|
      Song.new_by_filename(song)
    }
  end
end
