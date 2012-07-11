require_relative 'document.rb'

doc1 = Document.new('Tag Line1','Kirk','These are the voyages')
doc2 = Document.new('Tag Line2','Kirk','of the star ship ...')

total_document = doc1 + doc2
puts total_document.content
puts total_document.inspect