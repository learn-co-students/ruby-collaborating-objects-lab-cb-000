require 'pry'

class MP3Importer
  attr_accessor :path, :file_list

  def initialize(path)
    @path = path
    @file_list = []
  end

  def files
    Dir.new(@path).each do |item|
      next if item == '.' or item == '..'
      @file_list << item
    end
    @file_list
  end

  def import
    list = self.files
    list.each do |file_name|
      song = Song.new_by_filename(file_name)
      song.artist.add_song(song)
    end
  end

end
