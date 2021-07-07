class MP3Importer
  
  def initialize(file_path)
    @file_path = file_path
  end
  
  def path
    @file_path
  end
  
  def files
    result = []
    Dir.foreach(@file_path) do |item|
      next if item == '.' or item == '..'
      result.push(item)
    end
    result
  end
  
  def import
    self.files.each do |file|
      Song.new_by_filename(file)
    end
  end
  
  
end

