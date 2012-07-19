require_relative 'document.rb'

class FormLetter < Document
  
  def replace_word( old_word, new_word )
    @content.gsub!( old_word, "#{new_word}")
  end

  def method_missing( method_name, *args)
    string_name = method_name.to_s
    return super unless string_name =~ /^replace_\w+/
    old_word = extract_old_word(string_name)
    replace_word( old_word, args.first )
  end

  def extract_old_word(name)
    name_parts = name.split('_')
    name_parts[1].upcase
  end

  # fixing respond_to?() to include all replace_* methods

  def respond_to?( name )
    string_name = name.to_s
    return true if string_name =~ /^replace_\w+/
    super
  end

end


# example......

content = %q{
  Dear Mr LASTNAME

  Are you troubled by the heartache of hangnails?

  Is this your phone number?: PHONE

  FIRSTNAME, we look forward to hearing from you.
}

offer_letter = FormLetter.new( 'Special Offer', 'Acme Inc', content)

offer_letter.replace_firstname( 'Russ' )
offer_letter.replace_lastname( 'Olsen' )
offer_letter.replace_phone( '555-9982871' )

puts offer_letter.inspect