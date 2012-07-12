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
  def +(other)
    Document.new(title, author, "#{content} #{other.content}")
  end
=end

  def +(other)
    if other.kind_of?(String)
      return Document.new(title, author, "#{content} #{other}")
    end
    Document.new(title, author, "#{content} #{other.content}")
  end

  def !
    Document.new(title, author, "It is not true: #{content}")
  end

  # Uniary operator

  def +@
    Document.new(title, author, "I am sure that #{content}")
  end

  def -@
    Document.new(title, author, "I doubt that #{content}")
  end

  # Pseudo-array

  def [](index)
    words[index]
  end

  def size
    word_count
  end

end