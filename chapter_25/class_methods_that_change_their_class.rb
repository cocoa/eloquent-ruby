ENCRIPTION_ENABLED = true

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

  def self.enable_encryption( enabled )
    if enabled
      puts 'Encription enabled...'
      def encrypt_string(string)
        string.tr( 'a-zA-Z', 'm-za-lM-ZA-L')
      end
    else
      puts 'Encription disabled...'
      def encrypt_string(string)
        string
      end
    end
  end

  enable_encryption (ENCRIPTION_ENABLED)

end


# example. changing the encryption mode to the Document class.

Document.enable_encryption(false)





