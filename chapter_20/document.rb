class Document
  attr_accessor :title, :author, :content

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
  end

  def words
    @content.split
  end

  def word_count
    words.size
  end
end

=begin
my_document = Document.new(
  'Eloquent Ruby',
  'Russ Olsen',
  'A great book about Ruby')

puts my_document.inspect
=end