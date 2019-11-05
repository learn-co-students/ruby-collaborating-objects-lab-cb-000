class MP3Importer
  attr_accessor :path, :files

  def initialize(file)
    @path = file
    @files = []
    input_songs
  end

  def input_songs
    @files = Dir.entries(@path)
    @files.delete('.')
    @files.delete('..')
  end

  def import
    @files.each { |file| Song.new_by_filename(file) }
  end
end
