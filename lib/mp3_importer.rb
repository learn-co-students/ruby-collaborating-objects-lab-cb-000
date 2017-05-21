class MP3Importer
  attr_accessor :path

  def initialize file_path
    self.path = file_path
  end

  def import
    songs = files.map do |file|
      song =  Song.new_by_filename(file)
      song_name = song.name
    end
    # binding.pry
    songs
  end

  def files
    file_list = Dir.entries(self.path).select {|f| !File.directory? f}
  end
end
