class DocumentSaveListener
  def on_save(doc,path)
    puts "Hey, I've been saved!"
  end
end

class DocumentLoadListener
  def on_load(doc,path)
    puts "Hey, I've been loaded!"
  end
end


class Document
  attr_accessor :load_listener
  attr_accessor :save_listener

  # most of the class omited

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
  end

  def load(path)
    @content = File.read(path)
    load_listener.on_load(self,path) if load_listener
  end

  def save(path)
    File.open( path, 'w') { |f| f.print( @content ) }
    save_listener.on_save(self,path) if save_listener
  end

end


# example

doc = Document.new('Example', 'Russ', 'It was dark...')
doc.load_listener = DocumentLoadListener.new
doc.save_listener = DocumentSaveListener.new

doc.load('example.txt')
doc.save('example.txt')

puts "I am #{doc.inspect}"