# the module analog of inherited is included

module WritingQuality

  def self.included(klass)
    puts "Hey, I've been included in #{klass}"
  end

  def number_of_cliches
    # omited...
  end

end


# combination of class & instance methods mixed into a class as a unit.

module UsefulMethods
  module ClassMethods
    def a_class_method
    end
  end

  def self.included( host_class )
    puts "UsefulMethods included in #{host_class}"
    host_class.extend(ClassMethods)
  end

  def an_instance_method
  end

  # rest of the module deleted...
end


class Host
  include UsefulMethods
 
  at_exit do
    puts "Goodbye!"
  end
end