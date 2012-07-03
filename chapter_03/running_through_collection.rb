require File.dirname(__FILE__) + '/document.rb'
require 'pp'



words = %w{ Mary had a little lamb }

# don't do these...
for i in 0..words.size
  puts words[i]
end

# instead do it this way
words.each {|word| puts word}

# multiline mode
words.each do |x|
  puts x
  # bla, bla, bla...
end



movie = { :title => '2001', :genre => 'sci fi', :rating => 10 }

movie.each {|entry| pp entry}

movie.each {|name, value| puts "#{name} => #{value}"}



my_doc = Document.new(
  'Eloquent Ruby',
  'Russ Olsen',
  'A gReAt BOOK aBoUt RuBy.')

pp my_doc.words.map { |word| word.size }

lower_case_words = my_doc.words.map { |word| word.downcase }

pp lower_case_words