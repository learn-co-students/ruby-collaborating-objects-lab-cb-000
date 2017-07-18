require 'pry'

class Artist
    attr_accessor :name 
    attr_reader :songs
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        self.save
    end

    def add_song(song)
        self.songs << song
    end

    def save
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.find_or_create_by_name(name)
        match = nil
        self.all.each do |artist|
            match = artist if artist.name == name
        end
        (match.nil?)? self.new(name) : match
    end

    def print_songs
        self.songs.each {|song| puts "#{song.name}"}
    end

end

# binding.pry