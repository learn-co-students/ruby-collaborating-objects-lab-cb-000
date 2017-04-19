require 'pry'
class MP3Importer
  attr_accessor :path

  def initialize(file_path)
    @path = file_path
    # @files = []
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    # file_names = Dir.glob("#{path}/*.mp3")
    # @files = file_names.collect do |file|
    #   File.basename file
    # end
  end

  def import
    files.each {|file_name| Song.new_by_filename(file_name)}
  end

end
