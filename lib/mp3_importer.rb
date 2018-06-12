class MP3Importer

    attr_accessor :path, :files

    def initialize(path)
        @path = path
    end

    def files
        @files = []
        Dir.entries(@path).each{|file|
            @files << file if file.end_with?(".mp3")
        }
        @files
    end

    def import
        files
        @files.each{ |file|
            song = Song.new_by_filename(file)
        }
    end

end
