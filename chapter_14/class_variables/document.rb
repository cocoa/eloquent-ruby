class Document

  @@default_paper_size = :a4

  # class variables are not visible to the outside world
  # so we need to supply a pair of accessor methods

  def self.default_paper_size
    @@default_paper_size
  end

  def self.default_paper_size=(new_size)
    @@default_paper_size = new_size
  end



  attr_accessor :title, :author, :content
  attr_accessor :paper_size

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
    @paper_size = default_paper_size
  end

  def words
    @content.split
  end

  def word_count
    words.size
  end
end