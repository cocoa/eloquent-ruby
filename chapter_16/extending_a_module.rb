require './document.rb'
require './finders_module.rb'

class Document
  extend Finders
end

puts Document.ancestors.inspect
puts Document.singleton_methods.inspect

text = "my way or the highway does the trick"
my_tome = Document.new('Hackneyed', 'Russ', text)


def my_tome.hacker
  puts "One hack a day..."
end

puts my_tome.inspect
puts my_tome.singleton_methods.inspect