class MP3Importer
  attr_reader :path
  def initialize(path)
    @path = path
  end

  def files
    filenames = Dir["#{path}/*.mp3"]
    filenames.collect {|fn| normalize_filename(fn)}
  end

  def normalize_filename(filename)
    filename.split('/').last
  end

  def import
    files.each do |fn|
      Artist.create_from_filename(fn)
    end
  end
end
