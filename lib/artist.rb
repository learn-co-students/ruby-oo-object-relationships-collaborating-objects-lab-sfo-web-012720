class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end

    def songs
        Song.all.filter { |song| song.artist == self }
    end 

    def add_song(song)
        song.artist_name = self.name
    end

    def self.find_or_create_by_name(x)
        if @@all.find {|artist| artist.name == x}
            return @@all.find {|artist| artist.name == x}
        else
            Artist.new(x)
        end 
    end

    def print_songs
        Song.all.filter do |song|
            if song.artist == self
                puts song.name
            end
        end
    end

    def self.all
        @@all
    end
end