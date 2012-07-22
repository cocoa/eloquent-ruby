require_relative 'structured_document.rb'
require_relative 'paragraph.rb'

class Instructions < StructuredDocument
  def introduction( text )
    paragraph = Paragraph.new( :mono, 14, :none, text)
    self << paragraph
  end

  def warning( text )
    paragraph = Paragraph.new( :arial, 22, :bold, text)
    self << paragraph
   end

  def step( text )
    paragraph = Paragraph.new( :nimbus, 14, :none, text)
    self << paragraph
  end

  # and so on...
end