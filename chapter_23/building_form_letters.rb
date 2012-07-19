require_relative 'document.rb'

class FormLetter < Document

  def replace_word( old_word, new_word )
    @content.gsub!( old_word, "#{new_word}" )
  end

  def replace_firstname( new_first_name )
    replace_word( 'FIRSTNAME', new_first_name)
  end

  def replace_lastname( new_last_name )
    replace_word( 'LASTNAME', new_last_name)
  end

end

content = %q{
  Dear Mr LASTNAME

  Are you troubled by the heartache of hangnails?
  ...

  FIRSTNAME, we look forward to hearing from you.
}

offer_letter = FormLetter.new( 'Special Offer', 'Acme Inc', content)

# offer_letter.replace_word( 'FIRSTNAME', 'Russ')
# offer_letter.replace_word( 'LASTNAME', 'Olsen')

offer_letter.replace_firstname( 'Russ' )
offer_letter.replace_lastname( 'Olsen' )

puts offer_letter.inspect