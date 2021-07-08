class Artist

  attr_accessor :name, :songs
  @@all = []

  def initialize (name)
    @name = name
    @songs = []

  end

  def add_song (song)
    @songs << song

  end

  def songs
    @songs
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)

    found = false
    @@all.each do |artist|
        if artist.name == name
          found = true
        end
    end
    if found == false
      self.create(name)
    else
      self.find(name)
    end
  end

  def self.find(name)
    self.all.find {|artist| artist.name == name }
  end

  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end

  def print_songs
    @songs.each do |son|
      puts "#{son.name}\n"
    end
  end

end
