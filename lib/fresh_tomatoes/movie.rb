class FreshTomatoes::Movie
    @@all = []
    attr_accessor :title, :description, :tomatometer, :audience_score, :rating, :runtime

    def initialize(title)
        @title = title
        @@all << self
    end

    def self.all
        @@all
    end
end