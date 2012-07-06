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

  private :word_count

  # This method works because self is the right thing,
  # the document instance, when you call it.
  def print_word_count
    n = word_count
    puts "The number of words is #{word_count}"
  end

  def add_authors(*names)
    @author += " #{names.join(' ')}"
  end

  def index_for(word)
    words.find_index { |this_word| word == this_word }
  end

  def average_word_length
    total = words.inject(0.0) { |result, word| word.size + result }
    total / word_count
  end

=begin
  def about_me
    puts "I am #{self}"
    puts "My title is #{self.title}"
    puts "I have #{self.word_count} words"
  end
=end

  # don't call 'self.method' if you can call simply 'method'
  def about_me
    puts "I am #{self}"
    puts "My title is #{title}"
    puts "I have #{word_count} words"
  end

  def to_s
    "Document: #{title} by #{author}"
  end

end