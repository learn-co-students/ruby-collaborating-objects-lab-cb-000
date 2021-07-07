class Artist
  @@all = []
  
  
  def self.all()
    @@all
  end

  def self.find_or_create_by_name(name)
    a = @@all.find{|s| s.name == name}
    if a.nil? 
       my_new_artist = Artist.new(name)
       my_new_artist.save()
       return my_new_artist
    else
       return a
    end
  end
  
  attr_accessor :name, :song_array
 
  def initialize(name)
    @name = name
    @song_array = []
  end
  
  
  def name=(name)
   @name = name
  end
  
  def add_song(song)
    @song_array << song
  end
  
  def songs() 
    @song_array
  end
  
  def save()
    @@all << self
  end
  
  def print_songs()
    @song_array.each {|s| puts s.name}
  end
  
end