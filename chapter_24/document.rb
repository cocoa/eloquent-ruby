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

  def average_word_length
    len = words.inject(0.0) { |total, word| word.size+total }
    len/word_count
  end
  
end