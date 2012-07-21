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

  # rest of the class omited

  if RUBY_VERSION >= '1.9'
    def char_at( index )
      @content[index]
    end
  else
    def char_at( index )
      @content[index].chr
    end
  end

  # enable or disable encription

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

  # encryption disabled at startup...
  # enable_encryption (ENCRIPTION_ENABLED)

  # auto-reloadable document

  def self.reload
    remove_instance_methods
    load( __FILE__ )            # require vs. load
  end

  def self.remove_instance_methods
    instance_methods(false).each do |method|
      remove_method(method)
    end
  end

end
