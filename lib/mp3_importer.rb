class MP3Importer
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries('./db/mp3s').reject{|entry| entry == "." || entry == ".." || !entry.end_with?(".mp3")}
  end

  def import
    @files.each do |file|
      split = file.split(" - ")
      artist = split[0]
      name = split[1]
      genre = split[2].split(".mp3")[0]
      Artist.new(name)
    end
  end

end

'./db/mp3s'

entry = "Zoo Kid - Out Getting Ribs - hip-hop.mp3"
