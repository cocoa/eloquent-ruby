require './document.rb'

# fixing the String class to allow between string and document
class String
  def +( other )
    if other.kind_of? Document
      new_content = self + other.content
      return Document.new(other.title, other.author, new_content)
    end
    result = self.dup
    result << other.to_str
    result
  end
end

# example
doc = Document.new('Bio','Russ',' my resume.')
new_doc = 'This is' + doc
puts new_doc.inspect