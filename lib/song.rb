class Song
  attr_accessor :name, :artist, :genre

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    song_data = file_name.split(' - ')
    new_song = self.new(song_data[1])
    new_song.genre = song_data[2].chomp('.mp3')
    new_song.artist_name = song_data[0]
    new_song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
end
