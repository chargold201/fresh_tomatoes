class FreshTomatoes::Scraper
    @@url = "https://www.rottentomatoes.com/top/bestofrt/"

    def self.scrape_movies
        pg = Nokogiri::HTML(open(@@url))
        movies = pg.css("table#Top-Box-Office tr.sidebarInTheaterOpening")
        movies.each do |m|
            title = m.css("td.middle_col").text.strip
            binding.pry
        end
    end

    def self.scrape_details(movie)

    end
end