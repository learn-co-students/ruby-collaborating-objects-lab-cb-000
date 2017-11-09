class MP3Importer
  attr_reader :path, :files

  def initialize(path)
    @path = path
    @files = Dir.entries(path).collect { |entry| entry if entry.size > 3 }.compact
    puts @files
  end

end
