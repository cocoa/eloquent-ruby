class StructuredDocument
  attr_accessor :title, :author, :paragraphs

  def initialize( title, author)
    @title = title
    @author = author
    @paragraphs = []
    yield(self) if block_given?
  end

  def <<(paragraph)
    @paragraphs << paragraph
  end

  def content
    @paragraphs.inject('') {|memo,para| "#{memo}\n#{para}"}
  end

end