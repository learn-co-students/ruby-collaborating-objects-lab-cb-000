# require "pry"
# class MP3Importer
#
#   attr_reader :path
#
#   def initialize(path)
#     @path = path
#   end
#
#   def files
#      @files ||= Dir.entries(self.path).grep(/\w+.mp3/)
#
#   end
#
#   def import
#     files.each do |filename|
#       Song.new_by_filename(filename)
#     end
#
#   end
#
# end

class MP3Importer
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    files.each{|f| Song.new_by_filename(f)}
  end
end
