# Some broken code
person = {}
person[:name] = 'russ'
person[:eyes] = 'misty blue'

# wrong
puts "Name: #{person['name']} \
Eyes: #{person['eyes']}"

# correct
puts "Name: #{person[:name]} \
Eyes: #{person[:eyes]}"