class MP3Importer
  attr_accessor :path

  def initialize(filepath)
    @path = filepath
    @mp3_names = []
  end

  def files
    @path_directory = Dir["#{@path}/*.mp3"]
    @path_directory.map! do |path|
      path.gsub!(/\.\/spec\/fixtures\/mp3s\//, "")
    end
  end

  def import
    @mp3_names = self.files
    @mp3_names.each do |filename|
      Song.new_by_filename(filename)
    end
  end

end



test_music_path = "./spec/fixtures/mp3s"
music_importer = MP3Importer.new(test_music_path)
music_importer.files
music_importer.import
