require 'pp'


class MostlyEmpty
  puts "hello form inside the class"
  puts "The value of self is: #{self}"
  puts "The hierarchy is: #{self.ancestors.inspect}"
end



class LessEmpty
  # passing false because we don't want to see 
  # all the inherited methods.
  pp instance_methods(false)

  def do_something
    puts "I'm doing something!"
  end

  pp instance_methods(false)
end



class TheSameMethodTwice
  def do_something
    puts "first version"
  end

  # In between method definitions

  def do_something
    puts "second version"
  end
end

twice = TheSameMethodTwice.new
twice.do_something


# Classic monkey patching example

class TheSameMethodTwiceReopen
  def do_something
    puts "first version"
  end
end

class TheSameMethodTwiceReopen
  alias_method :old_do_something, :do_something
  def do_something
    puts "second version"
    old_do_something
  end
end

twice_reopened = TheSameMethodTwiceReopen.new
twice_reopened.do_something




