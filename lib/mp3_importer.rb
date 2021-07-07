class MP3Importer
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files()
    my_files = []
    Dir.foreach(path) do |file| 
      if file.include? 'mp3'
        my_files << file 
      end
    end
    my_files
  end
  
  def import()
    filename = self.files()
    filename.each do |file| 
      Song.new_by_filename(file) 
    end
  end
  
  

  
   
end


