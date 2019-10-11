require_relative 'lib/film'
require "nokogiri"
require 'open-uri'

films =[]

films = Film.from_list

puts "Список режиссеров:"
directors = films.map { |x| x.director }.uniq
directors.each.with_index(1) do |director, index|
  puts "#{index}: #{director}"
end

user_choice = 0
puts

until user_choice.between?(1, directors.size)
  puts "Выберите режиссера:"
  user_choice = gets.to_i
end

puts "Вы выбрали:"
film_choice = films.select { |x| x.director == directors[user_choice - 1] }.sample
puts film_choice
