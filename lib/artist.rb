class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    self.songs.push(song)
  end

  def save
   @@all.push(self)
   @@all.uniq!

  end

  def self.find_or_create_by_name(name)
    returned_artist = nil
    self.all.each do |artist|
      if artist.name == name
        returned_artist = artist
      end
    end
    if returned_artist != nil
      returned_artist
    else
      returned_artist = self.new(name)
    end
  end

  def print_songs
    @songs.each { |s| puts s.name}

  end

  def songs
    @songs
  end



end

Artist.find_or_create_by_name("Washed Out")

# johnny_greenwood = Artist.new("Johnny Greenwood")
# johnny_greenwood.save
# Artist.all
# Artist.find_or_create_by_name("Johnny Greenwood")
# Artist.find_or_create_by_name("David Bowie")
