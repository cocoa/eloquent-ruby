class TextCompressor

  attr_reader :unique, :index

  def initialize(text)
    @unique = []
    @index = []

    words = text.split

    words.each do |word|
      i = unique_index_of( word )
      if i
        @index << i
      else
        @index << add_unique_word( word )
      end
    end

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

text = "This specification is the specification for a specification"
compressor = TextCompressor.new(text)
puts compressor


