require "pry"

class Song
		attr_accessor :name
		attr_reader :artist
	
	def initialize(name)
	   	@name = name
	end

	
	def self.new_by_filename(file)
		new_song = file.split(" - ")
		song = Song.new(new_song[1])
		artist=(new_song[0])
		song
	end

	def artist=(name)
	    @artist = Artist.find_or_create_by_name(name)
	    artist.add_song(self) unless artist.songs.include?(self)
	end	


end


	    
	