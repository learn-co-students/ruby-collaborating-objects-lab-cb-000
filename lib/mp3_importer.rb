class MP3Importer
  attr_accessor :path, :files
  
  def initialize(path)
    @path = path
    @files = self.files
  end
  
  def files
    @files = Dir.glob("#{@path.to_s}/*.mp3")
    @files.collect{|filename| filename.split("/")[-1]}
  end
  
  def import
    @files.each{|filename| Song.new_by_filename(filename)}
  end
  
end