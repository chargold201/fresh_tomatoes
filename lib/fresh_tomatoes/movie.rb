class FreshTomatoes::Movie
    @@all = []
    attr_reader :title, :url, :tomatometer
    attr_accessor :audience_score, :rating, :runtime, :description

    def initialize(title, url, tomatometer)
        @title = title
        @url = url
        @tomatometer = tomatometer
        @@all << self
    end

    def self.all
        @@all
    end

    def self.sorted_movies
        @@all.sort {|a, b| a.tomatometer.gsub("%", "").to_i <=> b.tomatometer.gsub("%", "").to_i}
    end
end