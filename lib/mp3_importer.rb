class MP3Importer
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.entries(@path).reject{|entry| entry == "." || entry == ".."}
  end

  def import
    self.files.each do |filename|
      Song.new_by_filename(filename)
    end
  end
end



#MP3Importer.new('./db/mp3s').import

#Dir["/path/to/search/*"]

#Dir['./db/mp3s']
