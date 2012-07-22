require './structured_document.rb'
require './paragraph.rb'


# monkey patching

class StructuredDocument

  # previously, in Structured Document...

  def self.paragraph_type( paragraph_name, options)
    name = options[:font_name] || :arial
    size = options[:font_size] || 12
    emphasis = options[:font_emphasis] || :normal
    
    define_method( paragraph_name ) do |text|
      paragraph = Paragraph.new( name, size, emphasis, text)
      self << paragraph
    end
  end

  # new code...

  def self.privatize
    private :content
    def self.disclaimer
      "This document is a deep, dark secret"
    end
  end

  def self.disclaimer
    "This document is here for all to see"
  end

end



# new subclass of StructuredDocument

class BankStatement < StructuredDocument
  paragraph_type( :bad_news,
    :font_name => :arial,
    :font_size => 60,
    :font_emphasis => :bold)

  privatize # it makes content private in this subclass...
end



# example 

statement = BankStatement.new( 'Bank Statement', 'Russ') do |st|
  st.bad_news "You're broken"
end

puts statement.inspect
puts BankStatement.disclaimer

# error: private method `content' called for 
# #<BankStatement:0x007fa5f404c5f8> (NoMethodError)
puts statement.content