class MP3Importer
  attr_accessor :path


  def initialize(file_path)
    @path = file_path
    @files = []
  end

  def files
    @files = Dir.entries(path)
    @files.delete(".")
    @files.delete("..")
    @files
  end

  def import
    files.each{|songname|
      title = songname.split(" - ")[1]
      artist = songname.split(" - ")[0]
      song = Song.new_by_filename([artist,title].join(" - "))
    }
  end


end
