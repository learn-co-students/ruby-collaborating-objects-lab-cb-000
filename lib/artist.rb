class Artist
  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def print_songs
    print @songs
  end

  def self.find_or_create_by_name(name)
  end
end
