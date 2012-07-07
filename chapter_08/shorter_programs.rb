require "#{File.dirname(__FILE__)}/document.rb"
require "#{File.dirname(__FILE__)}/lazy_document.rb"

doc = Document.new('Russ Olsen', 'Eloquent Ruby', 'First doc example...')
lazy = LazyDocument.new('test_file.txt')

puts doc.inspect
puts lazy.inspect

# wake up the lazy doc...
lazy.title
puts lazy.inspect

duck = lazy
puts "Title: #{duck.title}"
puts "Author: #{duck.author}"
puts "Content: #{duck.content}"
