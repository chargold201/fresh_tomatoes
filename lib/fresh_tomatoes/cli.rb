class FreshTomatoes::CLI
    def run
        puts Rainbow("     
     ____            __     ______                __             
    / __/______ ___ / /    /_  __/__  __ _  ___ _/ /____  ___ ___
   / _// __/ -_|_-</ _ \\    / / / _ \\/  ' \\/ _ `/ __/ _ \\/ -_|_-<
  /_/ /_/  \\__/___/_//_/   /_/  \\___/_/_/_/\\_,_/\\__/\\___/\\__/___/
                                                                     ").green
        puts Rainbow("\n**************************").red
        puts Rainbow("Welcome to Fresh Tomatoes!").red
        puts Rainbow("**************************").red
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
        puts "\n\nHere are the top 10 Certified Fresh movies in theaters now:\n\n"
        FreshTomatoes::Scraper.scrape_movies
        FreshTomatoes::Movie.sorted_movies.each.with_index(1) {|m, i| puts "#{i}. #{m.title} - #{m.tomatometer}"}
        # binding.pry
    end

    def pick_movie
        puts "\nPlease enter the number of the movie you are interested in:"
        input = gets.strip.to_i
        if input.between?(1,FreshTomatoes::Movie.all.length)
            movie = FreshTomatoes::Movie.sorted_movies[input-1]
            FreshTomatoes::Scraper.scrape_details(movie) unless movie.description
            display_movie_details(movie)
        else
            puts "\nSorry, that is not a valid option."
        end
    end

    def display_movie_details(movie)
        puts Rainbow("\n\n--#{movie.title}--\n").blue
        puts Rainbow("Tomatometer:    ").cyan+"#{movie.tomatometer}"
        puts Rainbow("Audience Score: ").cyan+"#{movie.audience_score}"
        puts Rainbow("Rating:         ").cyan+"#{movie.rating}"
        puts Rainbow("Runtime:        ").cyan+"#{movie.runtime}"
        puts Rainbow("\nDescription:").cyan+"\n#{movie.description}"
    end
end