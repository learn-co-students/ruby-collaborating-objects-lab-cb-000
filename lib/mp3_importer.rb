class MP3Importer

  #attr_accessor :path, :artist
  attr_reader :path, :files

  def initialize(path)
    @path = path
    files
    import
  end

  def files
    @files = Dir["#{path}/**/*.mp3"]
    @files.map! { |file| file.gsub(/\.\/spec\/fixtures\/mp3s\//, '') }
    @files
  end

  def import
    files.each do |filename|
      Song.new_by_filename(filename)
    end
  end


end
