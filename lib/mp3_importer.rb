=begin
    References:
    [1] https://stackoverflow.com/questions/20793180/get-file-name-and-extension-in-ruby

=end
require 'pry'
require_relative './artist.rb'
require_relative './song.rb'

class MP3Importer
    attr_accessor :path

    def initialize(music_path)
        @path = music_path
    end

    # return an array of all mp3s in the path
    def files
        # fetch the appropriate files
        file_paths = Dir.glob("#{self.path}/*.mp3")

        # return a list of mp3s
        files = []
        file_paths.map do |file_path|
            files << File.basename(file_path)
        end
        files
    end

    def import
        self.files.each do |filename|
            Song.new_by_filename(filename)
        end
    end

end

# binding.pry