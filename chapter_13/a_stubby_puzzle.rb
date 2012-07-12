# create a stub printer by hand...

hand_built_stub_printer = Object.new

def hand_built_stub_printer.available?
  true
end

def hand_built_stub_printer.render(content)
  content # nil
end

puts hand_built_stub_printer.available?
puts hand_built_stub_printer.render('me')


# Singleton methods can override any regular
# class-defined methods

uncooperative = "dont ask my class"

def uncooperative.class
  "I'm not telling"
end

puts uncooperative.class


# an alternative sintax for defining singleton methods

hand_built_stub_printer = Object.new

class << hand_built_stub_printer

  def available?
    true
  end

  def render(content)
    content # nil
  end

end

puts hand_built_stub_printer.available?
puts hand_built_stub_printer.render('me')

