class MP3Importer
  attr_accessor :path
  def initialize(path)
    @path = path
  end



  def files # returns an array of just the filenames, e.g. "Beyonce - 1+1 - house.mp3"
    @files ||= Dir.glob("#{path}/*.mp3").collect do |file|
      file.gsub("#{path}/", "")
    end
    #@files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") } # Learn.co solution
  end
  def import
    # Song.new_by_filename(some_filename)

    files.each do |file|
      Song.new_by_filename(file)
    end

    #files.each{|f| Song.new_by_filename(f)} # Learn.co solution
  end
end
