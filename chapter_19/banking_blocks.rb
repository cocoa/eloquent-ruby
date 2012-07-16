class Document
  attr_accessor :load_listener
  attr_accessor :save_listener

  # most of the class omited

  def on_save(&block)
    @save_listener = block
  end

  def on_load(&block)
    @load_listener = block
  end

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
  end

  def load(path)
    @content = File.read(path)
    @load_listener.call(self,path) if @load_listener
  end

  def save(path)
    File.open( path, 'w') { |f| f.print( @content ) }
    @save_listener.call(self,path) if @save_listener
  end

end


# example

doc = Document.new('Example', 'Russ', 'It was dark...')

doc.on_save {|doc| puts "I've been saved!"}
doc.on_load {|doc| puts "I've been loaded!"}

doc.load('example.txt')
doc.save('example.txt')

puts "I am #{doc.inspect}"

