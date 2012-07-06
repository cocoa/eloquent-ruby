class RomanceNovel < Document
  def number_of_steamy_words
    word_count / 4    # Works: self is a Document instance!
  end
end