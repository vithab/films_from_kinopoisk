require_relative 'lib/film'
require_relative 'lib/film_collection'
require "nokogiri"
require 'open-uri'

films = FilmCollection.from_list
directors = films.director_list

puts "Список режиссеров:"

directors.each.with_index(1) do |director, index|
  puts "#{index}: #{director}"
end

user_choice = 0
puts

until user_choice.between?(1, directors.size)
  puts "Выберите режиссера:"
  user_choice = gets.to_i
end

chosen_director = films.by_user_choice(user_choice)

film_choice = films.film_choice(chosen_director)

puts "Вы выбрали:"
puts "#{film_choice}"
