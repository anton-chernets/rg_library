require './memento.rb'
# class for read statistics library
class Analytics

  FILE_FOR_ANALYTICS = 'order'

  include MementoLibrary

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
    parse_json(FILE_FOR_ANALYTICS).each { |x| result.push x[key] }
    result.inject(Hash.new{ 0 }){ |result, i|
      result[i] += 1
      result
    }
  end
end
