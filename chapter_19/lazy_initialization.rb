require 'net/http'

class ArchivalDocument
  attr_reader :title, :author

  def initialize(title, author, path)
    @title = title
    @author = author
    @path = path
  end

  def content
    @content ||= File.read(path)
  end
end


# saving the code block for a lazy initialization

class BlockBasedArchivalDocument
  attr_reader :title, :author

  def initialize(title, author, &block) # block always at the end
    @title = title
    @author = author
    @initializer_block = block
  end    

  def content
    if @initializer_block
      @content = @initializer_block.call
      @initializer_block = nil
    end
    @content
  end
end


# use cases

file_doc = BlockBasedArchivalDocument.new('file','russ') do
  File.read('example.txt')
end

google_doc = BlockBasedArchivalDocument.new('http','russ') do
  Net::HTTP.get_response('www.google.com','/index.html').body
end

boring_doc = BlockBasedArchivalDocument.new('silly', 'russ') do
  'Ya' * 100
end
 
# fire up blocks

file_doc.content
google_doc.content
boring_doc.content

puts file_doc.inspect
puts google_doc.inspect
puts boring_doc.inspect