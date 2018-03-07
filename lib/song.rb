class Song

  attr_accessor :name, :artist
  # attr_accessor :name

  def initialize(name)
    @name = name

  end

  # def artist_name(name)
  #   Artist.find_or_create_by_name(name)
  #
  # end

  def self.artist_name(name)
    Artist.find_or_create_by_name(name)
    #
    # x

  end

  def self.new_by_filename(file)
    # break up the filename
    stuff = file.split(' - ')
    # p stuff
    song = self.new(stuff[1])
    # puts stuff

    # why is that method named artist name ?
    artist = self.artist_name(stuff[0])
    # all the artists are there. on what pass around does this even happen? how would i know?
    # p artist.name
    # artist isnt a class
    artist.add_song(song)

    song
  end

end
