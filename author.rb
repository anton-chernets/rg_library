require './memento.rb'
# class for author
class Author

  include MementoLibrary

  def to_s
    'author'
  end
end
