class Presentation < Document
  @default_font = :nimbus

  class << self
    attr_accessor :default_font
  end
  
  def initialize(title, author)
    @title = title
    @author = author
    @font = Presentation.default_font
  end
  
  # most of the class omitted...

end