require 'pry'

class MP3Importer

attr_accessor :path

def initialize(path)
  @path = path
end

def files
  a = Dir["#{path}/**.mp3"]
  a.map {|x| File.basename(x)}
end

def import
  files.each {|i| Song.new_by_filename(i)}
end

end
