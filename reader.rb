require './memento.rb'
# class for reader
class Reader

  include MementoLibrary

  def to_s
    'reader'
  end
end