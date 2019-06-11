class FreshTomatoes::Movie
    @@all = []
    attr_accessor :title, :description, :tomatometer, :audience_score, :rating, :runtime, :url

    def initialize(title, url, tomatometer)
        @title = title
        @url = url
        @tomatometer = tomatometer
        @@all << self
    end

    def self.all
        @@all
    end
end