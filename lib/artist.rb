class Artist

attr_accessor :name, :songs
@@all = []


  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def print_songs
    @songs.each do |song| puts song.name end
  end


  def add_song(song)
    @songs << song
  end

  # def songs
  #   @songs
  # end



  def self.all
    @@all
  end

  # def self.find_or_create_by_name(name)
  #   if @@all.detect do |artist| artist.name == name end
  #     nil
  #   else
  #     artist = Artist.new(name)
  #     artist.save
  #     artist
  #   end
  # end

  def self.find_or_create_by_name(name)
     self.find(name) ? self.find(name) : self.create(name)
   end

   def self.create(name)
     art = self.new(name)
     art.save
     art
   end

   def self.find(name)
     @@all.detect{|artist| artist.name == name}
   end
end
