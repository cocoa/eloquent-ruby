require_relative 'structured_document.rb'
require_relative 'paragraph.rb'

russ_cv = StructuredDocument.new( 'Resume', 'RO') do |cv|
  cv << Paragraph.new( :nimbus, 14, :bold, 'Russ Olsen')
  cv << Paragraph.new( :nimbus, 12, :italic, '1313 Mocking Bird Lane')
  cv << Paragraph.new( :nimbus, 12, :none, 'russ@russolsen.com')
  # ... and so on 
end

puts russ_cv.content
