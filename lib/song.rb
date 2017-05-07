class Song
	attr_accessor :name, :artist

	@@all = []

	def initialize(name)
		@name = name
	end

	def save
		@@all << self
		@@all
	end

	def self.new_by_filename(filename)
		song = self.new(filename)
		song.save
		song.name = filename.split(" - ")[1]
		song.artist_name = filename.split(" - ")[0]
		song
	end

	def artist_name=(artist_name)
		if(@artist.nil?)
			@artist = Artist.new(artist_name)
			@artist.save
		else
			@artist = artist_name
			@artist.save
		end
	end
end
