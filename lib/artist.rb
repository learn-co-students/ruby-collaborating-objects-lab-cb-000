class Artist

  @@all = []
  attr_accessor :name, :songs

  def initialize( name )
    @name = name
    @songs = []
  end

  def add_song( song )
    @songs <<  song
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name( name )
    #puts "FindOrCreateByName - searching for:#{name}:"
    found = 0
    foundArtist = 0

    @@all.each do  |value|
      if value.name == name
        foundArtist = value
      end
    end

    if foundArtist == 0
      newArtist = Artist.new(name)
      newArtist.save
      newArtist
    else
      foundArtist
    end

  end

  def print_songs
    songs.each{|song| puts song.name }
  end

end
