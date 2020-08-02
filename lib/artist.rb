class Artist


attr_accessor :name


@@all = []
@@array =[]

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

def  add_song(music)
  music.artist = self

end

def songs
 Song.all.select{|x| x.artist ==self}

end

def print_songs
  array = self.songs
  array.each do |song|
    puts song.name
  end

end

def self.find_or_create_by_name(name)
   @@artists_store = Artist.all.each{|artist|artist.name==name}
   artist =Artist.new(name)
   if @@artists_store.empty?
     return artist
  else
    return @@artists_store[0]
  end


end

end
