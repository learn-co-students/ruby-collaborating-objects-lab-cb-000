class MP3Importer
  attr_accessor :path, :files

  def initialize(file_path)
    @path = file_path
    all_files = Dir.entries(@path).reject do |f|
      File.directory? f
    end
    @files = all_files.select {|f| f.split(".")[1] == "mp3"}
  end

  def import
    @files.each {|file_name| Song.new_by_filename(file_name)}
  end
end
