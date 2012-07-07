class LazyDocument < BaseDocument

  attr_writer :title, :author, :content

  def initialize(path)
    @path = path
    @document_read = false
  end

  def read_document
    return if @document_read
    File.open(@path) do |f|
      @title = f.readline.chomp
      @author = f.readline.chomp
      @content = f.read
    end
    @document_read = true
  end

  def title
    read_document
    @title
  end

  def author
    read_document
    @author
  end

  def content
    read_document
    @content
  end

  def words
    read_document
    @content.split
  end

  def word_count
    words.size 
  end

end
