class Artist

attr_accessor :name, :songs
@@all = []

  def initialize(name)
    @name = name
    @songs = []
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
  def save
    @@all << self
  end

  def print_songs
    @songs.each do |song| puts song.name end
  end

  # coding directly self.find_or_create_by_name(name) pass the tests but conflict with the #import test
  # def self.find_or_create_by_name(name)
  #   if @@all.detect do |artist| artist.name == name end
  #     nil
  #   else
  #     artist = Artist.new(name)
  #     artist.save
  #     artist
  #   end
  # end

   def self.create(name)
     artist = self.new(name)
     artist.save
     artist
   end

   def self.find(name)
     @@all.detect{|artist| artist.name == name}
   end


   def self.find_or_create_by_name(name)
      self.find(name) ? self.find(name) : self.create(name)
   end

end
