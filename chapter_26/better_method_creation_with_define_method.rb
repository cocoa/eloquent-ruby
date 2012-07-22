require './structured_document.rb'
require './paragraph.rb'

# monkey patching StructuredDocument...

class StructuredDocument
  def self.paragraph_type( paragraph_name, options)
    name = options[:font_name] || :arial
    size = options[:font_size] || 12
    emphasis = options[:font_emphasis] || :normal

    # creating a new method by class_eval'ing a string
    #
    # code = %Q{
    #   def #{paragraph_name}( text )
    #     p = Paragraph.new(:#{name}, #{size}, :#{emphasis}, text)
    #     self << p
    #   end
    # }
    # class_eval( code )

    define_method( paragraph_name ) do |text|
      paragraph = Paragraph.new( name, size, emphasis, text)
      self << paragraph
    end

  end
end


# new Instructions class

class Instructions < StructuredDocument
  paragraph_type( :introduction,
    :font_name => :mono,
    :font_size => 14,
    :font_emphasis => :none)
  
  paragraph_type( :warning,
    :font_name => :arial,
    :font_size => 22,
    :font_emphasis => :bold)

  paragraph_type( :step,
    :font_name => :nimbus,
    :font_size => 14,
    :font_emphasis => :none)
end


# example

lcd_tv = Instructions.new('lcd manual', 'ruby') do |man|
  man.introduction 'Thanks for purchasing'
  man.warning "Don't drop water over it"
  man.step 'Plug-in power cord'
end

puts lcd_tv.inspect
puts "Instance methods available: #{Instructions.instance_methods(false)}"