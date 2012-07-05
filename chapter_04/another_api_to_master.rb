require 'pp'

# sub, gsub
puts 'It is warm outside'.sub( 'warm', 'cold' )
puts 'yes yes'.sub( 'yes', 'no' )
puts 'yes yes'.gsub( 'yes', 'no' )

# split
pp 'It was a dark and stormy night'.split
pp 'Bill:Shakespeare:Playwright:Globe'.split( ':' )

# sub!
title = 'It was a dark and stormy night'
title.sub!( 'dark', 'bright' )
title.sub!( 'stormy', 'clear' )
pp title

# index
pp "It was a dark and stormy night".index( "dark" )
