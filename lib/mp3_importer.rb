class MP3Importer

  attr_accessor :path

  def initialize (path)

    @path = path
    #files

  end

  def files
    files = Dir["#{@path}/*.mp3"]
    files2 = []

    files.each do |file|
      files2 << file.split("#{@path}/")[1]
    end
    return files2
  end



  def import()
      files2 = files
      files2.each do |file|
        Song.new_by_filename(file)
      end
  end

end
