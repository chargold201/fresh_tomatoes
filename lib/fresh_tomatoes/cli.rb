class FreshTomatoes::CLI
    def run
        self.greeting
        self.list_movies
        self.pick_movie
    end

    def greeting
        puts "\nWelcome to Fresh Tomatoes!"
    end

    def list_movies
        puts "\nHere are the top 10 Certified Fresh movies in theaters now:"
        FreshTomatoes::Scraper.scrape_movies
        FreshTomatoes::Movie.all.each.with_index(1) {|m, i| puts "#{i}. #{m.title} - #{m.tomatometer}"}
    end

    def pick_movie
        puts "\nPlease enter the number of the movie you are interested in:"
        input = gets.strip.to_i
        movie = FreshTomatoes::Movie.all[input-1]
        FreshTomatoes::Scraper.scrape_details(movie)
        display_movie_details(movie)
    end

    def display_movie_details(movie)
        puts "\n-#{movie.title}-"
        puts "Description: #{movie.description}"
        puts "Audience Score: #{movie.audience_score}"
        puts "Rating: #{movie.rating}"
        puts "Runtime: #{movie.runtime}"
    end
end