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

  # changes start here

  def save(path)
    File.open(path, 'w') do |f|
      f.puts( encrypt(@title) )
      f.puts( encrypt(@author) )
      f.puts( encrypt(@content) )
    end
  end

  if ENCRYPTION_ENABLED
    def encrypt(string)
      string.tr('a-zA-Z','m-za-lM-ZA-L')
    end
  else
    def encrypt(string)
      string
    end
  end

end