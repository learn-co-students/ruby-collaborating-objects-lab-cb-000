class MP3Importer
	attr_accessor :path

	@@path =[]

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
		if (@mp3.nil?)
			self.files
		else
			@mp3.each{|filename|Song.new_by_filename(filename)}
		end
	end

	def self.save 
		Song.artist_name = @artist_name
		Artist.new(@artist_name)
	end
end
