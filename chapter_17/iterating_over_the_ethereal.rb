require_relative 'document.rb'

12.times { |i| puts "The number is #{i}"}

doc = Document.new('Donuts', '?', 'I love donuts mmmm donuts' )
doc.each_word_pair{ |first, second| puts "#{first} #{second}" }