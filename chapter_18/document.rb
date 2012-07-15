class Document
  attr_accessor :title, :author, :content

  def initialize(title, author, content='')
    @title = title
    @author = author
    @content = content
    yield(self) if block_given?  # initialization block
  end

  # rest of the class omited

end