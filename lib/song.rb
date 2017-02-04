class Song

  attr_accessor :name, :artist

  def initialize(title)
    @name = title
  end

  def self.new_by_filename(filename)
    split = filename.split('.')[0].split(' - ')
    song = self.new(split[1])
    Artist.find_or_create_by_name(split[0]).add_song(song)
    song
  end

end
