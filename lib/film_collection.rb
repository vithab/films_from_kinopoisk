require_relative 'film'

class FilmCollection
  attr_reader :films

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

  def initialize(films)
    @films = films
  end

  def to_s
    "#{films}"
  end
end
