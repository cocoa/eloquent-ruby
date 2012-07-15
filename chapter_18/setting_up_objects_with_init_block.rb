require_relative 'document.rb'

new_doc = Document.new('U.S. Constitution', 'Madison','') do |d|
  d.content << 'We the people, '
  d.content << 'in order to form a more perfect union, '
  d.content << 'provide for the common defense ...'
end

puts new_doc.inspect