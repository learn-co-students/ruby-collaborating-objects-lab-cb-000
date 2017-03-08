# require "pry"

class MP3Importer
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files

    @files ||= Dir.entries(self.path).grep(/\w+.mp3/)

  end

  def import
    files.each { |filename| Song.new_by_filename(filename) }
  end
end
