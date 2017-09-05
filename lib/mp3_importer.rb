require_relative './artist.rb'
require_relative './song.rb'

class MP3Importer

  attr_accessor :path

  def initialize(music_path)

    @path = music_path

  end

  def files
    file_paths = Dir.glob("#{self.path}/*.mp3")
    files = []
    file_paths.map do |file_path|
      files << File.basename(file_path)
    end
    files
  end

  # def import
  #   self.files.each do |filename|
  #     Song.new_by_filename(filename)
  #   end
  # end
  def import
    self.files.each do |filename|
      Song.new_by_filename(filename)
    end
  end

end
