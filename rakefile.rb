require_relative 'lib/artist.rb'
require_relative 'lib/song.rb'
require_relative 'lib/mp3_importer.rb'
require 'pry'
require 'rake'

def reload!
  load 'lib/artist.rb'
  load 'lib/song.rb'
  load 'lib/mp3_importer.rb'
end

task :console do
  Pry.start
end
