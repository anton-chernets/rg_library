require './memento.rb'
# class for order
class Order

  include MementoLibrary

  def to_s
    'order'
  end
end