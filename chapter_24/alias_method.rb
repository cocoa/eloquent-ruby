require './document.rb'

# fixing the String class to allow between string and document
class String

  # it copies the method '+' giving the fresh copy the name 'old_addition'
  alias_method :old_addition, :+

  def +( other )
    if other.kind_of? Document
      new_content = self + other.content
      return Document.new(other.title, other.author, new_content)
    end
    old_addition( other )
  end
end

# example
doc = Document.new('Bio','Russ',' my resume.')
new_doc = 'This is' + doc
puts new_doc.inspect