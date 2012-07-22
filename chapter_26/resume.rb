require_relative 'structured_document.rb'
require_relative 'paragraph.rb'

class Resume < StructuredDocument
  def name( text )
    paragraph = Paragraph.new(:nimbus, 14, :bold, text)
    self << paragraph
  end

  def address( text )
    paragraph = Paragraph.new(:nimbus, 12, :italic, text)
    self << paragraph
  end

  def email(text)
    paragraph = Paragraph.new(:nimbus, 12, :none, text)
    self << paragraph
  end
end


# example


russ_cv = Resume.new('russ', 'cv') do |cv|
  cv.name 'Russ Olsen'
  cv.address '1313 Mocking Bird Lane'
  cv.email 'russ@russolsen.com'
  # etc...
end

puts russ_cv.inspect