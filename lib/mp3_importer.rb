class MP3Importer

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).select { |file| file.include?(".mp3") }
  end

  def import
    self.files.each do |file|
      data = file.chomp('.mp3').split(' - ')
      artist = Artist.find_or_create_by_name(data[0])
      song = Song.new_by_filename(data[1])
    end
  end
  
end