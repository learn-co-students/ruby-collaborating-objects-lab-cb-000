require 'pry'

class MP3Importer
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    filelist = Dir.entries(@path)
    filelist.each do | file |
      file == ".." || file == "." ? nil : @files << file
    end
    @files
  end

  def import
    self.files.each { | file | Song.new_by_filename(file) }
  end
end
