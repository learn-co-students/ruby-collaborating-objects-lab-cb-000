class MP3Importer
  attr_reader :path, :files

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(@path).reject{|entry| entry == "." || entry == ".." || !entry.end_with?(".mp3")}
  end

  def import
    self.files if files == nil
    @files.each do |file|
      split = file.split(" - ")
      artist_name = split[0]
      song_name = split[1]
      genre = split[2].split(".mp3")[0]
      if Artist.all.detect {|artist| artist.name == artist_name} == nil
        artist = Artist.new(artist_name)
        artist.save
      else
        artist = Artist.all.detect {|artist| artist.name == artist_name}
      end
      artist.add_song(Song.new(song_name))
    end
  end

end
