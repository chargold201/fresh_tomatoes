class FreshTomatoes::CLI
    def run
        puts "\nWelcome to Fresh Tomatoes"
        self.list_movies
        self.pick_movie
        loop do
            puts "\nWould you like to view information on another movie?"
            input = gets.strip.downcase
            if input == "y" || input == "yes"
                self.pick_movie
            elsif input == "n" || input == "no"
                puts "\nThank you, good bye!"
                break
            else
                puts "\nThat is not a valid response."
            end
        end
    end

    def list_movies
        puts "\nHere are the top 10 Certified Fresh movies in theaters now:"
        FreshTomatoes::Scraper.scrape_movies
        FreshTomatoes::Movie.all.each.with_index(1) {|m, i| puts "#{i}. #{m.title} - #{m.tomatometer}"}
    end

    def pick_movie
        puts "\nPlease enter the number of the movie you are interested in:"
        input = gets.strip.to_i
        if input.between?(1,FreshTomatoes::Movie.all.length)
            movie = FreshTomatoes::Movie.all[input-1]
            FreshTomatoes::Scraper.scrape_details(movie) unless movie.description
            display_movie_details(movie)
        else
            puts "\nSorry, that is not a valid option."
        end
    end

    def display_movie_details(movie)
        puts "\n-#{movie.title}-\n\n"
        puts "Tomatometer:    #{movie.tomatometer}"
        puts "Audience Score: #{movie.audience_score}"
        puts "Rating:         #{movie.rating}"
        puts "Runtime:        #{movie.runtime}"
        puts "\nDescription:  \n#{movie.description}"
    end
end