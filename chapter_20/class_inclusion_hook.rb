require './document.rb'

class DocumentReader
  class << self
    attr_reader :reader_classes
  end
  
  @reader_classes = []
  
  def self.read(path)
    reader = reader_for(path)
    return nil unless reader
    reader.read(path)
  end

  def self.reader_for(path)
    reader_class = DocumentReader.reader_classes.find do |klass|
      klass.can_read?(path)
    end
    return reader_class.new(path) if reader_class
    nil 
  end

  def self.inherited(subclass)
    DocumentReader.reader_classes << subclass
  end

end



class PlainTextReader < DocumentReader
  def self.can_read?(path)
    path =~ /.*\.txt/
  end
  
  def initialize(path)
    @path = path
  end
  
  def read(path)
    puts "PlainTextReader..."
=begin
    File.open(path) do |f|
      title = f.readline.chomp
      author = f.readline.chomp
      content = f.read.chomp
      Document.new( title, author, content )
    end
=end
  end
end



class YAMLReader < DocumentReader
  def self.can_read?(path)
    /.*\.yaml/ =~ path
  end

  def initialize(path)
    @path = path
  end
  
  def read(path)
    # omited...
    puts "YAMLReader..."
  end
end



class XMLReader < DocumentReader
  def self.can_read?(path)
    /.*\.xml/ =~ path
  end

  def initialize(path)
    @path = path
  end
  
  def read(path)
    # omited...
    puts "XMLReader..."
  end
end


puts DocumentReader.instance_variables.inspect
puts DocumentReader.new.instance_variables.inspect
puts DocumentReader.reader_classes.inspect


puts DocumentReader.read("file.txt")
puts DocumentReader.read("file.xml")
puts DocumentReader.read("file.yaml")