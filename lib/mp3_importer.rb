class MP3Importer
  attr_accessor(:path)
  def initialize(path)
    @path=path
  end

  def files
    files=[]
    Dir["#{@path}"]
    Dir.entries("#{@path}").each do |file|
      if file == "." || file == ".."
      else
        files << file
      end
    end
    files
  end

  def import
    all_files=self.files
    all_files.each do |file_name|
      Song.new_by_filename(file_name)
    end
  end

end
