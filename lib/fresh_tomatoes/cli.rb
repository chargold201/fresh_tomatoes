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
        puts "Here is a list of the Certified Fresh movies in theaters now:"
        FreshTomatoes::Scraper.scrape_movies
        FreshTomatoes::Movie.all.each.with_index(1) {|m, i| puts "#{i}. #{m.title}"}
    end

    def pick_movie
        puts "Please enter the number of the movie you are interested in:"
        input = gets.strip.to_i
        movie = FreshTomatoes::Movie.all[input-1]
        FreshTomatoes::Scraper.scrape_details(movie)
        display_movie_details(movie)
    end

    def display_movie_details(movie)
        puts "Description: #{movie.description}"
        puts "Tomatometer: #{movie.tomatometer}"
        puts "Audience Score: #{movie.audience_score}"
        puts "Rating: #{movie.rating}"
        puts "Runtime: #{movie.runtime}"
    end
end