class MP3Importer
  attr_reader :path, :files

  def initialize(path)
    @path = path
    @files = Dir["#{@path}/*.mp3"]
    @files = @files.collect { |file| file.gsub("#{@path}/", "") }
  end

  def import
    @files.each do |file|
      artist = Song.new_by_filename(file)
    end
  end
end
