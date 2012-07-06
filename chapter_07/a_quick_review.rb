require_relative 'document'
require 'pp'

doc = Document.new( 'Ethics', 'Spinoza', 'By that which is...')
doc.word_count
#pp doc
doc.about_me


# subclassing
class RomanceNovel < Document
  # omited...
end
heart = RomanceNovel.new( 'Love', 'Anderson', 'Trust in love...')
puts "RomanceNovel superclass is #{RomanceNovel.superclass}"
heart.about_me