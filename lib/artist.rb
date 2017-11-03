class Artist

  @@all = []

attr_accessor :name, :songs

  def initialize(artist_name)
    @name = artist_name
    @songs = []
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
    find(name) ? find(name) : create(name)
  end

  def self.find(name)
    all.find{|artist| artist.name == name}
  end

  def self.create(name)
    new(name).tap(&:save)
  end

  def print_songs
    @songs.each do |x|
      puts x.name
    end
  end

end
