class MP3Importer
    attr_accessor :path
    def initialize(path)
        @path = path
        @files = []
    end
    def files
        step_one = []
        step_two = []
        step_one = Dir.entries(@path)
        step_one.each do |full_filename|
            step_two << full_filename.split("/").last
        end
        step_two.each do |end_of_filename|
            if end_of_filename.scan(/\.mp3$/) == [".mp3"]
               @files << end_of_filename
            end
        end
        @files
    end
    def import
        self.files
        @files.each do |filename|
            Song.new_by_filename(filename)
        end
    end
end
