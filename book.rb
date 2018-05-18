require './memento.rb'
# class for book
class Book

  include MementoLibrary

  def to_s
    'book'
  end
end
