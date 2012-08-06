content = 'The Princess And The Monkey

Once upon a time there was a princess...
...and they all lived happily ever after.

The End'


# it matches the regexp at 29
/Once upon a time/ =~ content # 29

# starts with -> \A
/\AOnce upon a time/ =~ content # nil

# ends with -> \z
/and they all lived happily ever after\z/ =~ content # nil

# the circumflex ^ to match the beginning of the content or 
# the beginning of any new line within the content
puts "Found it! at the beginning..." if content =~ /^Once upon a time/

# the dolar sign $ to match the ending of the content or
# the ending of any new line within the content
puts "Found it! at the ending..." if content =~ /ever after\.$/

# m modifier at the ending of the regular expresion turns on
# the match between lines
puts "catched!" if /^Once upon a time.*ever after\.$/m =~ content