class Artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
    #bull!
    song.artist = self
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

    # real estate going in 2 times.
    # but there's nothing that is just taking the name here.

    any = self.all.any? {|obj| obj.instance_variable_get("@name") === name}

    if any
      ans = self.all.collect do |person|
        if person.instance_variable_get("@name") === name
          person
        end
      end
      # if there is a match, that obj has to be returned though
      # binding.pry
      ans.compact[0]

    else
      ans = self.new(name)
      @@all << ans
      ans
    end

    # ans = self.all.collect do |person|
    #   if !person.name
    #     artist = self.new(name)
    #   else
    #     person
    #   end
    # end
    # ans[0]

  end

  def print_songs
    @songs.each {|i| puts i.name}

  end
end
