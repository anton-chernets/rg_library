require 'json'
# module for write, read and parse
module MementoLibrary

  JSON_PATH = 'storage/json/'
  JSON_FORMAT = '.json'

  def write(filename, data)
    File.open(JSON_PATH + filename + JSON_FORMAT, "w") do |file|
      file.write(data)
    end
  end

  def read(filename)
    File.read(JSON_PATH + filename + JSON_FORMAT)
  end

  def parse_json(filename)
    JSON.parse(read(filename))
  end
end
