require_relative 'document.rb'


d = Document.new('Truth','Gump','Life is like a box of ...')
d.each_word { |word| puts word }
d.each_character { |char| puts char }


=begin
d.each_word do |word|
  puts word
end
=end