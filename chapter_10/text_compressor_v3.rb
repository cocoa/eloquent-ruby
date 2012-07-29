class TextCompressor

  attr_reader :unique, :index

  def initialize(text)
    @unique = []
    @index = []
    add_text( text )
  end

  def add_text(text)
    words = text.split
    words.each {|word| add_word(word)}
  end

  def add_word(word)
    # From Array class: #index(obj) → int or nil
    i = unique_index_of(word) || add_unique_word(word)
    @index << i
  end

  def unique_index_of(word)
    @unique.index(word)
  end

  def add_unique_word(word)
    @unique << word
    @unique.length - 1
  end

  def to_s
    puts "unique = #{@unique}"
    puts "index  = #{@index}"
  end

end



# example

#text = "This specification is the specification for a specification"
#compressor = TextCompressor.new(text)
#puts compressor


