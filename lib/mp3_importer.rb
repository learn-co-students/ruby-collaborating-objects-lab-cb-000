class MP3Importer
  attr_reader :path, :files
  @@original_path = Dir.pwd + "/"

  # NOTE: following logic is encapsulated in class method here, since
  #   specification requires that Song class be able to access this
  #   method in conjunction with its required #new_by_filename class method.
  def self.import_file(file)
    file_components = file[0, file.length - 4].split(" - ")
    artist = Artist.find_or_create_by_name(file_components[0])
    song = Song.new(file_components[1])
    artist.add_song(song)
    song.artist = artist
    return song
  end

  def initialize(path)
    @path = path
    Dir.chdir(@@original_path + path)
    @files = Array.new
    Dir.glob("*.mp3").each{|file| @files << file}
  end

  def import()
    files.each{|file| MP3Importer.import_file(file) }
  end
end
