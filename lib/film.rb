class Film
  attr_reader :title, :director, :year

  URL = 'https://www.kinopoisk.ru/top/lists/1/'

  def self.from_list
    films = []
    html = open(URL)
    doc = Nokogiri::HTML(html)
    doc.css('table#itemList .news').each do |film|
      title_parse = film.css("a").first.text
      director_parse = film.css(".gray_text a").first.text
      year_parse = film.css("span").first.text.scan(/\d{4}/)[0]
      films << Film.new(title_parse, director_parse, year_parse)
    end
    films
  end

  def initialize(title, director, year)
    @title = title
    @director = director
    @year = year
  end

  def to_s
    "#{@director} - #{@title} (#{@year})"
  end
end
