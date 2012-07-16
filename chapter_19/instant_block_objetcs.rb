class Document

  DEFAULT_LOAD_LISTENER = lambda do |doc, path|
    puts "Loaded: #{path}"
  end

  DEFAULT_SAVE_LISTENER = lambda do |doc, path|
    puts "Saved: #{path}"
  end

  attr_accessor :title, :author, :content

  def initialize(title,author,content)
    @title = title
    @author = author
    @content = content 
    @load_listener = DEFAULT_LOAD_LISTENER
    @save_listener = DEFAULT_SAVE_LISTENER
  end

  # rest of the class omitted for brevity

end