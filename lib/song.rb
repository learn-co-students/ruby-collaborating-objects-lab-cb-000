class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file)
    x = file.split(" - ")
    x.first 2
    song_name = self.new(x[1])
    song_name.artist_name = x[0] # Artist name
    song_name
  end
  # class methods can be called from elsewhere by, for ex. "Song.new_by_filename"
  # in this case, "Song.new_by_filename" is called in mp3_importer's #import instance method.
  # string.split(condition or /regex/) returns an array, stored in variable x
  # variable x array is manipulated by the #first method and defined by 2, i.e. x.first 2
  # this returns an array of the first two items from the previous array of three items.
  # song_name = self.new(x[1]) initializes a song instance targeting x array's 2nd position as the argument
  # song_name.artist_name = x[0] targets the artist_name instance method of Song
  #


  def artist_name=(name)
    @artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
end
# #artist_name is a custom "setter" instance method
# instance variable @artist is set to equal external class method Artist.find_or_create_by_name(name)
