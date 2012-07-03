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


require 'pp'

movie = { :title => '2001', :genre => 'sci fi', :rating => 10 }

movie.each {|entry| pp entry}

movie.each {|name, value| puts "#{name} => #{value}"}
