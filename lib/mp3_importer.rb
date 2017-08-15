

class MP3Importer
  attr_accessor :path, :files

  def initialize(music_path)
        @path = music_path
        @files = Dir.entries(@path).delete_if { |e| e == "." || e == ".."  }


  end


  def import
    @files.each do |e|

      Song.new_by_filename(e)

    end


  end


end
