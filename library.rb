require 'json'

class Library

  def to_s
    "library"
  end

  def write(data)
    File.open("storage/json/#{self.to_s}.json","w") do |file|
      file.write(data.to_json)
    end
  end

  def read
    File.read("storage/json/#{self.to_s}.json")
  end

  def parseJson
    JSON.parse(self.read)
  end
end

class Author < Library

  def to_s
    "authors"
  end
end

class Book < Library

  def to_s
    "books"
  end
end

class Reader < Library

  def to_s
    "readers"
  end
end

class Order < Library

  def to_s
    "orders"
  end


  def top_reader
    self.grouper('reader').invert.max.last
  end

  def top_book
    self.grouper('book').invert.max.last
  end

  def amount_readers_three_top_books
  self.grouper('book').values.max(3).sum
  end

  protected

  def grouper(key)
    result = []
    self.parseJson.each { |x| result.push x[key] }
    result.inject(Hash.new{ 0 }){ |result, i|
      result[i] += 1
      result
    }
  end
end

#End program

#Test data

# Save all Library data to files

#for example .json format
author = Author.new
puts "#{author} #{author.write({ "id": "1","name": "Kon","biography": "Lorem ipsum" })}"
# for example .json format
book = Book.new
puts "#{book} #{book.write([{ "id" => "1", "title" => "book title", "author" => "1" }, { "id" => "2", "title" => "book title2", "author" => "1" }])}"
reader = Reader.new
puts "#{reader} #{reader.write({ "id" => "1", "name" => "Den", "email" => "a@a.a", "sity" => "Dnipro", "street" => "Fabra", "house" => "25" })}"
order = Order.new
puts "#{order} #{order.write([{"book":"2","reader":"2","date":"2018-05-03 16:35:52 +0300"}, {"book":"2","reader":"1","date":"2018-05-03 16:35:52 +0300"}, {"book":"1","reader":"2","date":"2018-05-03 16:35:52 +0300"}, {"book":"3","reader":"2","date":"2018-05-03 16:35:52 +0300"}, {"book":"3","reader":"2","date":"2018-05-03 16:35:52 +0300"}])}"
library = Library.new
puts "#{library} #{library.write("books": { "id" =>  ["1", "2"]}, "orders": { "id" =>  ["1"]}, "readers": { "id" =>  ["1"]}, "authors": { "id" =>  [1]})}"


# Get all Library data from files

library = Library.new
puts "#{library} info: #{library.read}"


# Who often takes the book

order = Order.new
puts "readers id: #{order.top_reader}"


# What is the most popular book

order = Order.new
puts "book id: #{order.top_book}"

# How many people ordered one of the three most popular books

order = Order.new
puts "tree most popular books ordered: #{order.amount_readers_three_top_books} peoples"
