# first definition of Document class
class Document
  attr_accessor :title, :author, :content

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
  end
end


# a Document class instance
cover_letter = Document.new( 'Letter', 'Russ', "Here's my resume")


# reopen the class Document to insert a new method
class Document
  def words
    @content.split
  end
  def word_count
    words.size
  end
end


# another method
class Document
  def average_word_length
    len = words.inject(0.0) { |total, word| word.size+total }
    len/word_count
  end
end


# we can use now the new method
puts "Average word length: #{cover_letter.average_word_length}"