class MP3Importer
#The MP3 Importer will parse all the filenames in the db/mp3s folder and send the filenames to the Song class
attr_accessor :path


  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).select{|x| x.include? "mp3"}
  end

  def import
    self.files.each do |x|
      Song.new_by_filename(x)
    end
  end

end
