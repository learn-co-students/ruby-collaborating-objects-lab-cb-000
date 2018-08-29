class MP3Importer 

  attr_accessor :path 

  def initialize(path)
    @path = path 
  end

  def files
    files = Dir["#{@path}/*.mp3"]
    x = @path.length
    files.each{ |filename| filename.slice!(0..x) }
    return files  
  end

  def import
    files.each { |filename| Song.new_by_filename(filename) }
  end
  
end