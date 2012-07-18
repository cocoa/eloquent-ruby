# command line: gem install text
require 'text'

class Document
  include Text

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

  # handling document errors: vervose
=begin
  def method_missing(method_name, *args)
    msg = %Q{
      You tried to call the method #{method_name}
      on an instance of #{self.class}. There is no such method.
    }
    raise msg
  end
=end

  # handling document errors: file
=begin
  def method_missing(method_name, *args)
    File.open('document.error.txt','a') do |f|
      f.puts("Bad method called: #{method_name}")
      f.puts("with #{args.size} arguments")
    end
  end
=end

  # ruby-style programming customer service...

  def method_missing(method_name, *args)
    candidates = methods_that_sound_like(method_name.to_s)
    message = "You called an undefined method: #{method_name}."

    unless candidates.empty?
      message += "\nDid you mean #{candidates.join(' or ')}"
    end
    raise NoMethodError.new(message)
  end

  def methods_that_sound_like( name )
    missing_soundex = Soundex.soundex( name.to_s )
    public_methods.sort.find_all do |existing|
      existing_soundex = Soundex.soundex( existing.to_s )
      missing_soundex == existing_soundex
    end
  end


  # const missing cousin

  def self.const_missing(const_name)
    msg = %Q{
      You tried to reference the constant #{const_name}
      There is no such constant in the Document class
    }
    raise msg
  end

end