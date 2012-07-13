class Document

  @default_font = :times

  def self.default_font=(font)
    @default_font = font
  end
  
  def self.default_font
    @default_font
  end


  def initialize(title, author)
    @title = title
    @author = author
    @font = Document.default_font
  end
  
  # Rest of the class omitted...

end