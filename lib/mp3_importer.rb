class MP3Importer

    attr_accessor :files, :path

    def initialize(path)
        @files = []
        @path = path
        Dir[@path + "/*.mp3"].map{ |f| File.basename f}.map{ |f| @files << f}
    end

    def files
      @files
    end

    def import
       @files.map{|x| Song.new_by_filename(x)}
    end



end
