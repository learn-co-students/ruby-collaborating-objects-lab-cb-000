class Artist

  attr_accessor :name
  @@all = Array.new


  def initialize(name)
    @name = name
    self.save
    @@songs = Array.new
  end

  def songs
    @@songs
  end

  def add_song(song)
    @@songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    @@all.each do |artist|
      if name == artist.name
        x = artist
        return x
      end
    end
    x = Artist.new(name)
  end

  def print_songs
    songs.each { |song| puts song.name}
  end

end
