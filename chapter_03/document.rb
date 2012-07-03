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

=begin
  def add_authors(names)
    @author += " #{names.join(' ')}"
  end
=end

  def add_authors(*names)
    @author += " #{names.join(' ')}"
  end

=begin
  def index_for(word)
    i = 0
    words.each do |this_word|
      return i if word == this_word
      i += 1
    end
    nil
  end
=end

  def index_for(word)
    words.find_index { |this_word| word == this_word }
  end

=begin
  def average_word_length
    total = 0.0
    words.each { |word| total += word.size }
    total / word_count
  end
=end

  def average_word_length
    total = words.inject(0.0) { |result, word| word.size + result }
    total / word_count
  end



end