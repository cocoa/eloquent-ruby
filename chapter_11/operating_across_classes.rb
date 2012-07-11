require_relative 'document.rb'

doc = Document.new( 'hi', 'russ', 'hello')
new_doc = doc + 'out there!'

puts new_doc.inspect