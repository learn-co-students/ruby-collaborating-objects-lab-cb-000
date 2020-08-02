class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path =path
  end

  def files
    directory =  Dir["#{self.path}/*"]
    directory.map do |file|
      file.slice!(self.path + "/")


    end
  return directory

  end


def import
 files.each do |file|
    Song.new_by_filename(file)
  end

end




end
