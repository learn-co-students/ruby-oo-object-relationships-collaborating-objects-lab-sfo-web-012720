class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        parsed_file = filename.chomp(".mp3").split(" - ")
        new_song = Song.new(parsed_file[1])
        new_song.artist_name = parsed_file[0]
        new_song
    end

    def artist_name=(artist)
        self.artist = Artist.find_or_create_by_name(artist)
    end

end