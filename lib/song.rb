class Song
  attr_accessor :name, :artist

  @@all = []


  def initialize(name)
    @name = name
    @@all << self
    @artist = "unknown"
  end

  def self.new_by_filename(filename)
    data=filename.split(' - ')
    puts data
    artist = Artist.find_or_create_by_name(data[0])
    puts artist
    song = self.new(data[1])
    puts "{ NEW SONG ADDED }"
    puts "song: #{song}"
    song.artist = artist
    puts "{ ADDED #{artist} TO SONG #{song}}"
    artist.add_song(song)
    puts "{ ADDED SONG #{song} TO ARTIST #{artist}}"
    puts "{ ** RECAP **}"
    puts "song.name: #{song.name}"
    puts "song.artist: #{song.artist}"
    puts "song.artist.name: #{song.artist.name}"
    puts "#{artist.name} - #{artist.songs}"
    puts "{ ENDING NEW BY FILENAME}"
    song 
  end

end
