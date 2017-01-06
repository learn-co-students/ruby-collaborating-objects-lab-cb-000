class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @artist = ""
  end

  def name=(name)
    @name = name
  end

  def add_song(song)
    @songs << song
    #song.artist = self
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
        break
      end
    end
  end
  if result == nil
    puts "No matches: The new artist will be: #{name}"
    result = self.new(name)
    puts "the new artist is #{result}"
    result.save
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
