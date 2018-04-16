require_relative './artist.rb'
require_relative './song.rb'

class MP3Importer
attr_accessor :path

def initialize(path)
  @path = path
end

def files
  filename = Dir.entries(@path)  #reveals all files in the path from initialize
  filename.delete(".") #removes all hidden files
  filename.delete("..") #removes the path and just shows File.basename https://stackoverflow.com/questions/38316448/how-can-i-remove-a-filename-extension-from-a-string-in-rails-4
  filename #returns the files
end

def import
  self.files.each { |filename| Song.new_by_filename(filename) }  #"Since we have to send the filenames to the Song class, we'll end up calling the following code in the #import method: Song.new_by_filename(some_filename). This will send us to the Song class, specifically Song.new_by_filename."
end

end
