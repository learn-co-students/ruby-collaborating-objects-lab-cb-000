class Song

attr_accessor :name, :artist

@@all = []

def initialize(name)
  @name = name
  save
end

def save
    @@all << self
end

def self.all
  @@all
end

def self.new_by_filename(filename)
  song = Song.new(filename.split(' - ')[1])
  artist = Artist.new(filename.split(' - ')[0])
  song.artist =artist
  return song
end

def artist_name=(name)
 artists_store = Artist.all.select{|artist|artist.name===name}

 if artists_store.empty?
   artist= Artist.new(name)
   self.artist = artist
else
    self.artist = artists_store[0]
end

end




end
