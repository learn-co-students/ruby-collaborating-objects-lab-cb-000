class MP3Importer
  attr_accessor :path, :files

  def initialize (path)
    @path = path
    @files = []
    self.import
  end


  def import
    @files = Dir["#{@path}/*.mp3"]
#    temp = @files.collect {|f| f.delete("#{@path}/")} WHY NOT?
    temp = @files.join
    temp = temp.split("./spec/fixtures/mp3s/")
    temp.shift
    @files = temp
    @files.each_with_index do |f, i|
      puts "Adding song #{i}"
      Song.new_by_filename(f)
      puts "Song #{i} has been added!"
      puts Artist.all
    end
  end


end
