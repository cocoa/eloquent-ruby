require 'pp'

# symbol to string
the_string = :all.to_s

# string to symbol
the_symbol = "all".to_sym

# public methods of an object
x = Object.new
pp x.public_methods