class MP3Importer

  attr_reader :path, :files

  def initialize(path)
    @path=path
    @files = Dir.entries(path).delete_if{|name| !name.end_with?('.mp3')}
  end

  def import
    files.each do |file|
      Song.new_by_filename(file)

    end
  end

end
