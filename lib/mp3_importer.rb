# implementing as spec file requires
class MP3Importer
  attr_accessor :path
  @files = []

  def initialize(path)
    @path = path
  end

  def files
    files = Dir["#{path}/*"]
    song_names = []
    files.each do |file|
      song_names << file.split(%r{/})[4].lstrip
    end
    song_names
  end

  def import
    files.each { |file| Song.new_by_filename(file) }
  end
end
