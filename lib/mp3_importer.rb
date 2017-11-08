class MP3Importer

attr_accessor :path, :files

def initialize(path)
  @path = path
  @files = Dir[@path+"/*.mp3"].collect{|filename| filename.split('/')[-1]}
  #Dir["./db/*.mp3"]
end

def import
@files.each do |file|
    Song.new_by_filename(file)
  end
end


end
