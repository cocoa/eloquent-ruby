require_relative 'document.rb'

doc = Document.new('Steve','Life','Short content...')

puts "doc object: #{doc}"
puts "doc instance methods: #{Document.instance_methods(false)}"

Document.remove_instance_methods
puts "instance methods removed..."
puts "doc instance methods: #{Document.instance_methods(false)}"
puts doc.inspect


Document.reload
puts "instance methods reloaded..."
puts "doc instance methods: #{Document.instance_methods(false)}"
puts doc.inspect