class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path=path
    #Call files method within initialize method?
  end

  def files
    #loads all the mp3 files in the path directory
    #normalizes the filename to just the mp3 filename with no path

    #Even though I changed the directory with the code below
    #Dir.glob("*.mp3") couldn't find the directory.
    #Error message: No such file or directory @ dir_chdir - ./spec/fixtures/mp3s
    #Dir.chdir(@path)

    #To get this to work had to chdir to absolute path for
    #this lab's directory then change directory again
    #to relative path in @path "./spec/fixtures/mp3s"

    Dir.chdir("/home/marcusjun/ruby-collaborating-objects-lab-cb-000")
    Dir.chdir(@path)

    #Or just use the absolute path from the start
    #Dir.chdir("/home/marcusjun/ruby-collaborating-objects-lab-cb-000/spec/fixtures/mp3s")

    @files = Dir.glob("*.mp3")


    ###########################################
    #Alternative option that retrieve all entries in the @path
    #but then you have to cleanup the array of non-mp3 files
    #@files=Dir.entries(@path)

    #What the @files array looks like
    #@files= [".", "Action Bronson - Larry Csonka - indie.mp3", "Real Estate - Green Aisles - country.mp3",
    #"Thundercat - For Love I Come - dance.mp3", "Real Estate - It's Real - hip-hop.mp3", ".."]

    #HORRIBLE WORKAROUND! but works
    #@files.delete_if {|entry| entry=="." || entry==".."}


    ###########################################
    #Unnecessary and non-functional code below

    #@files.shift
    #@files.pop

    #Dir.chdir("./spec/fixtures/mp3s/")

    #@files = Dir.glob("*.mp3")

    #@files = Dir.glob(@path + "*.mp3")
    #@files = Dir[path + "*.mp3"]
    #@files = Dir.entries(@path)

    #["Real Estate - Green Aisles - country.mp3", "Real Estate - It's Real - hip-hop.mp3",
    #"Action Bronson - Larry Csonka - indie.mp3", "Thundercat - For Love I Come - dance.mp3"]


    #########################################
    #Tried to strip .mp3 from end of strings
    #but don't need to per test specs
    #@files=@files.collect do |file_name|
    #@files.each do |file_name|
    #@files.collect do |file_name|
      #file_name=file_name.split(".mp3")
      #file_name.split(".mp3")
      #file_name=file_name.split(".mp3")
    #end

    #[["Real Estate - Green Aisles - country"], ["Real Estate - It's Real - hip-hop"], ["Action Bronson - Larry Csonka - indie"], ["Thundercat - For Love I Come - dance"]]

  end

  def import
    #imports the files into the library by creating songs from a filename

    #Call files method to import filenames
    files

    @files.each {|file| Song.new_by_filename(file)}

    #Code below works too
    #@files.each do |file|
      #Song.new_by_filename(file)
    #end

    ################################################
    #Code below doesn't work
    #Song.new_by_filename(@files)

    #if @files were only a single string
    #Song.new_by_filename(@files)

  end

end
