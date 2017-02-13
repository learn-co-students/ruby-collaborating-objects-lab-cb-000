class MP3Importer

  #don't want pppl to change after it is set
  attr_reader :path

  def initialize(path_to_files)
    @path = path_to_files
  end

  def files
    # Dir[@path] gives us array
    #have to gsub each filename to remove path from it
    @files ||= Dir["#{@path}/*.mp3"].collect{|f| f.gsub("#{@path}/","")}
  end

  def import
    #@files.each was throwing an error why?
    #ohhhh we are calling the files method and not the instance variable
    files.each{|f| Song.new_by_filename(f)}
  end


end
