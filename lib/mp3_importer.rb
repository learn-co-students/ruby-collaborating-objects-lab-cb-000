require 'pry'

class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    # files = Dir.entries(path).select {|f| !File.directory? f}
    # files

    Dir.children(@path)

    # Dir.entries("your/folder").select {|f| !File.directory? f}

  end

  def import
    all_files = self.files
    all_files.each do |song|
    Song.new_by_filename(song)
    end
  end
  # binding.pry
end
