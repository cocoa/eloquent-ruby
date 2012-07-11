require_relative 'document.rb'

names = []
names << 'Rob'
names << 'Denise'

puts names.inspect
puts "names size: #{names.size}"

favorite = Document.new( 'Favorite', 'Russ', 'Chocolate is best')
puts (!favorite).content

# unary

unsure = -(+favorite)
puts unsure.content