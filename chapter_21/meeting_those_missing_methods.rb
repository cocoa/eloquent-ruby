require_relative 'document.rb'


# Error: the method is content, not text!

doc = Document.new('Titanic','Cameron','Sail, crash, sink')

begin
  puts "The text is #{doc.text}"
rescue => e
  puts e.message
  puts e.inspect
end


# example with another class

class RepeatBackToMe
  def method_missing(method_name, *args)
    puts "Hey, you just called the #{method_name} method"
    puts "With these arguments: #{args.join(' ')}"
    puts "But there ain't no such method"
  end
end

repeat = RepeatBackToMe.new
repeat.hello(1,2,3)
repeat.goodbye('for', 'now')



