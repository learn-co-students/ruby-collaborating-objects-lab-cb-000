class Artist
  attr_accessor(:name)
  @@all=[]

  def initialize(name)
    @name=name
    @songs=[]
  end

  def save
    @@all << self
  end

  def add_song(song)
    @songs << song
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    if @@all.find{|artist| artist.name=name}
      artist=@@all.find{|artist| artist.name=name}
      artist
    else
      artist=Artist.new(name)
      artist.save
      artist
    end
  end

  def print_songs
    @songs.each do |song|
      puts "#{song.name}"
    end
  end

end
