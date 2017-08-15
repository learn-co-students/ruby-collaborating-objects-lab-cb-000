class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.entries(self.path)
    files.delete(".")
    files.delete("..")
    files
  end

  def import
    list_of_files = self.files
    list_of_files.each do |filename|
      metadata = filename.split(/\s-\s|\./)
      artist = Artist.find_or_create_by_name(metadata[0])
      song = Song.new(metadata[1])
      song.artist = artist
      artist.add_song(song)
    end
  end
end
