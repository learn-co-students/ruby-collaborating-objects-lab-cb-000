class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end





  def files
    # files = Dir[@path.concat("/*.mp3")]
    # array = []
    # files.each do |file|
    #   array.push(file.match(/[A-Z].*/))
    # end
    # array
    @files = Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    self.files.each{ |file| Song.new_by_filename(file) }

  end

end


# importer = MP3Importer.new('./db/mp3s')
# importer.files
# './db/mp3s'
#
# files = Dir['./db/mp3s/*.mp3']
# array = []
# files.each do |file|
#   array.push(file.match(/[A-Z].*/))
# end
# array
#
# file1.match(/[A-Z].*/)
