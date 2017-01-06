class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def name=(name)
    @name = name
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

def self.all
  @@all
end



  def self.find_or_create_by_name(name)
    result = nil
    if @@all.size>0
      @@all.each do |i|
        puts "checking against #{i.name}"
        if i.name == name
          puts "A match"
          result = i
        end
      end
    end
    if result == nil
      puts "No matches: The new artist will be: #{name}"
      result = self.new(name)
      puts "the new artist is #{result}"
    end
    puts "This is in the loop #{@@all}"
    result
  end

  def print_songs
    i = 0
    while i < @songs.length
      puts @songs[i].name
      i += 1
    end
  end



end


class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.new_by_filename(filename)
    data=filename.split(' - ')
    puts data
    artist = Artist.find_or_create_by_name(data[0])
    puts artist
    song = artist.add_song(data[1])
    puts song
    puts "#{artist.name} - #{artist.songs}"
  end

end


class MP3Importer
  attr_accessor :path, :files

  def initialize (path)
    @path = path
    @files = []
    self.import
  end


  def import
    @files = Dir["#{@path}/*.mp3"]
#    temp = @files.collect {|f| f.delete("#{@path}/")}
    puts @files
    temp = @files.join
    temp = temp.split("./spec/fixtures/mp3s/")
    temp.shift
    @files = temp
    puts @files
    @files.each_with_index do |f, i|
      puts "Adding song #{i}"
      Song.new_by_filename(f)
      puts "Song #{i} has been added!"
    end
  end


end


#david = Artist.new("David")
#song1 = Song.new("Song 1")
#song2 = Song.new("Song 2")
#david.add_song(song1)
#david.add_song(song2)

#puts david.songs

#  Artist.find_or_create_by_name("David")
#  Artist.find_or_create_by_name("Tom")

#  puts Artist.all

#  puts "1. a = Artist.find_or_create_by_name('Action Bronson')"
#  a = Artist.find_or_create_by_name('Action Bronson')
#  puts a
#  puts "***"
#  puts "2. b = Artist.new('David')"
#  b = Artist.new('David')
#  puts "***"
#  puts "3. c = Artist.find_or_create_by_name('David')"
#  c = Artist.find_or_create_by_name('David')
#  puts Artist.all

 # Song.new_by_filename('Action Bronson - Larry Csonka - indie.mp3')



# puts "Back to Import"

path = "./spec/fixtures/mp3s"
mp31= MP3Importer.new(path)



# puts "Artist Time"
# puts Artist.all
