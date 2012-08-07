require './document.rb'

# example using the ORIGINAL method
empty_doc = Document.new( 'Empty', 'Russ', '')
puts empty_doc.average_word_length

# fix the class before use
class Document
  def average_word_length
    return 0.0 unless word_count != 0
    total = words.inject(0.0) { |result,word| word.size + result }
    total / word_count
  end
end

# example using the FIXED method
empty_doc = Document.new( 'Empty', 'Russ', '')
puts empty_doc.average_word_length