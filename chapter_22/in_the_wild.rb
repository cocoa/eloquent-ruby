require_relative 'document.rb'
require 'delegate'

class DocumentWrapper < SimpleDelegator
  def initialize( real_doc )
    super( real_doc )
  end
end

text = 'The Hare was once boasting of his speed...'
real_doc = Document.new( 'Hare & Tortoise', 'Aesop', text )
wrapper_doc = DocumentWrapper.new( real_doc )

puts wrapper_doc.inspect
puts wrapper_doc.title
puts wrapper_doc.author
puts wrapper_doc.content

