class Artist
	attr_accessor :name

	@@all = []

	def initialize(name)
		@name = name
		@songs = []
	end

	def name=(name)
		if (name.nil?)
			Artist.new(name)
		else
			@name = name
		end
	end

	def add_song(song)
		@songs << song
	end

	def songs
		@songs
	end

	def self.all 
		@@all
	end

	def self.find_or_create_by_name(name)
		if (@@all.detect{|artist| artist.name == name}.nil?)
			artist = Artist.new(name)
			artist.save
			@@all.detect{|artist| artist == artist}
		else
			found_artist = @@all.detect{|artist| artist.name == name}
			found_artist
		end
	end

	def self.save
		@@all << self
	end

	def save
		@@all << self
	end

	def print_songs
		@songs.each{ |song| puts song.name }
	end
end
