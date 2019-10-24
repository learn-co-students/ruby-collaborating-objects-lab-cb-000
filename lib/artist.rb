class Artist
  attr_accessor :name
  attr_reader :songs
  @@all=[]

  def initialize(artist_name)
    @name=artist_name
    @songs=[]
    if @@all.select{|artist| artist.name==artist_name}==[]
      @@all << self
    end
    self
  end

  def self.find_or_create_by_name(artist_name)
    if @@all.select{|artist|artist.name==artist_name}==[]
      self.new(artist_name)
    else
      @@all.select{|artist|artist.name==artist_name}.first
    end

  end

  def add_song(song)
    self.songs << song
  end

  def print_songs
    self.songs.each{|song| puts song.name}
  end

  def self.all
    @@all
  end


  def save
    @@all << self
  end


end
