class FreshTomatoes::Scraper
    @@url = "https://www.rottentomatoes.com/top/bestofrt/"

    def self.scrape_movies
        pg = Nokogiri::HTML(open(@@url))
        movies = pg.css("table#Top-Box-Office tr.sidebarInTheaterOpening")
        movies.each do |m|
            title = m.css("td.middle_col").text.strip
            tomatometer = m.css("span.tMeterScore").text
            url = "https://www.rottentomatoes.com"+m.css("a").attribute("href").value
            FreshTomatoes::Movie.new(title, url, tomatometer)
        end
    end

    def self.scrape_details(movie)

    end
end