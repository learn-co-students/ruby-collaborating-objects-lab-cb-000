class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{path}/*.mp3").map do |file|
      file.gsub("#{path}/", "")
    end
  end
  # instance variable @files stores the Dir.glob method designed to look at the directory
  # of a path and single out only *.mp3 files within the target folder
  # then .map applies the block to all the *.mp3s and returns a new array stored in @files
  # @files = Dir.glob() is a method for accessing files in a directory with limited, regex-like
  # conditions. By "globbing" a number of files, you can use regular expression-like pattern matching
  # to select just the files you want.
  # The glob method will return all files that match the "globbing" rules as an array,
  # which can be saved for later use or iterated over. In this case iterated over with .map
  # .gsub("x", "y") strips out the first part of a string and adds in the 2nd.
  # in this case .gsub removes @path "./spec/fixtures/mp3s" replacing it with "" i.e. nothing.
  # .collect or .map applies the given block of code on all the items and returns the new array.
  # i.e. 'Projects each element of a sequence into a new form'
  # gsub(pattern, replacement) → new_str
  # @files = Dir.glob is a conventional way of storing the Dir.glob, but in this case we're .map'ing

  def import
    files.each do |x|
      Song.new_by_filename(x)
    end
  end
  # instance method #import calls the #files instance method, which pulls in the Dir of a path and makes a []
  # this method takes each item of the files [] and generates Song.new_by_filename(x) with each.

end
