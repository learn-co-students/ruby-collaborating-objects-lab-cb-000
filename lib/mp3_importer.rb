class MP3Importer
	attr_accessor :path

	@@all = []

	def initialize(path)
		@path = path
		#use regex to parse out the directory path?
	end

	def files
		@files = Dir.glob(@path + '/*.mp3')
		#remove path from name of file
		#files.detect {|file| /''/#files ending in mp3 } #print all mp3 songs from directory
		#use regex to parse out the directory path? 
		@mp3 = []
		@files.each do |file|
			mp3 = file.sub("#{@path}/", "")
			@mp3 << mp3
		end
		@mp3
	end

	def import
		files.each{|f|Song.new_by_filename(f)}
	end

end
