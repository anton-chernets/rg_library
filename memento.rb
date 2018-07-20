require 'json'
# module for write, read and parse
module MementoLibrary

  JSON_PATH = 'storage/json/'
  JSON_FORMAT = '.json'

  def write(data)
    File.open(JSON_PATH + self.to_s + JSON_FORMAT, "w") do |file|
      file.write(data)
    end
  end

  def read
    File.read(JSON_PATH + self.to_s + JSON_FORMAT)
  end

  def parse_json
    JSON.parse(read)
  end
end
