class Document

  include Enumerable

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

=begin
  def each_word
    word_array = words
    index = 0
    while index < words.size
      yield(word_array[index])
      index += 1
    end
  end
=end

  def each
    words.each { |word| yield(word) }
  end

  def each_word
    words.each { |word| yield(word) }
  end

  def each_character
    index = 0
    while index < @content.size
      yield(content[index])
      index += 1
    end
  end

=begin
  def each_word_pair
    word_array = words
    index = 0
    while index < word_array.size - 1
      yield(word_array[index], word_array[index + 1])
      index += 1
    end
  end
=end

  def each_word_pair
    words.each_cons(2) { |array| yield(array[0],array[1]) }
  end


end
