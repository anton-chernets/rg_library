require './library.rb'
require './order.rb'
require './reader.rb'
require './author.rb'
require './book.rb'
require './analytics.rb'

# Test data

# Save all Library data to files

# for example .json format
author = Author.new
puts "#{author} #{author.write('{ "id": "1","name": "Kon","biography": "Lorem ipsum" }')}"
# for example data in array ruby
book = Book.new
puts "#{book} #{book.write('[{ "id" => "1", "title" => "book title", "author" => "1" }, { "id" => "2", "title" => "book title2", "author" => "1" }]')}"
reader = Reader.new
puts "#{reader} #{reader.write('{ "id" => "1", "name" => "Den", "email" => "a@a.a", "sity" => "Dnipro", "street" => "Fabra", "house" => "25" }')}"
order = Order.new
puts "#{order} #{order.write('[{"book":"2","reader":"2","date":"2018-05-03 16:35:52 +0300"}, {"book":"2","reader":"1","date":"2018-05-03 16:35:52 +0300"}, {"book":"1","reader":"2","date":"2018-05-03 16:35:52 +0300"}, {"book":"3","reader":"2","date":"2018-05-03 16:35:52 +0300"}, {"book":"3","reader":"2","date":"2018-05-03 16:35:52 +0300"}]')}"
library = Library.new
puts "#{library} #{library.write('"books": { "id" =>  ["1", "2"]}, "orders": { "id" =>  ["1"]}, "readers": { "id" =>  ["1"]}, "authors": { "id" =>  [1]}')}"


# Get all Library data from files

library = Library.new
puts "#{library} info: #{library.read}"

# Who often takes the book

analytics = Analytics.new
puts "readers id: #{analytics.top_reader}"


# What is the most popular book

analytics = Analytics.new
puts "book id: #{analytics.top_book}"

# How many people ordered one of the three most popular books

analytics = Analytics.new
puts "tree most popular books ordered: #{analytics.amount_readers_three_top_books} peoples"