class MP3Importer

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).select { |file_name| file_name.include?(".mp3") }
  end

  def import
    self.files.each do |file|
      data = file.chomp('.mp3').split(' - ')
      artist = Artist.find_or_create_by_name(data[0])
      song = Song.new_by_filename(file)
      song.artist = artist
      artist.add_song(song)
    end
  end
  
end