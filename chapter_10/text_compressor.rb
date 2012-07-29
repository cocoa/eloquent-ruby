class TextCompressor

  attr_reader :unique, :index

  def initialize(text)
    @unique = []
    @index = []

    words = text.split

    words.each do |word|
      i = @unique.index(word)
      if i
        @index << i
      else
        @unique << word
        @index << unique.length - 1
      end
    end
  end

  def to_s
    puts "unique = #{@unique}"
    puts "index  = #{@index}"
  end

end



# example

text = "This specification is the specification for a specification"
compressor = TextCompressor.new(text)
puts compressor


