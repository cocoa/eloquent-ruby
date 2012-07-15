require_relative "document.rb"

doc = Document.new('Advice', 'Harry', 'Go ahead make my day')

puts doc.include?('make')
puts doc.include?('punk')

puts doc.to_a
puts doc.sort