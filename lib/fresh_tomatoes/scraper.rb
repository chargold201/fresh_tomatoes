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
        pg = Nokogiri::HTML(open(movie.url))
        movie.description = pg.css("div#movieSynopsis").text.strip
        movie.audience_score = pg.css("div.audience-score span.mop-ratings-wrap__percentage").text.strip
        movie.rating = pg.css("div:contains('Rating')+div.meta-value").text.strip
        movie.runtime = pg.css("div:contains('Runtime')+div time").text.strip
    end
end