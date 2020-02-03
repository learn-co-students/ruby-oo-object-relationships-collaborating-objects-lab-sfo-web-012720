class Artist
    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select{|song| song.artist == self}
    end

    def self.find_or_create_by_name(name)
        # check if artist name exists
        found_artist = self.all.find {|artist| artist.name == name}
        
        # if so output that
        if found_artist
            found_artist
        else
            # create new instance with given name
            new_artist = self.new(name)
            new_artist
        end
    end

    def print_songs
        songs.each {|song| puts song.name}
    end
end