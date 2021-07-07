require 'pry'
class MP3Importer
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  def files
    Dir.glob(self.path + "/*.mp3").map do |song|
      song.sub(self.path+'/', '')
    end
  end
  def import
    #binding.pry
    Song.add_songs_from_list(self.files)
  end
end
