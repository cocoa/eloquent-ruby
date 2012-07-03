def load_font(name, size=12)
  # Go font hunting
end

def load_font(specification_hash)
  # Load a font according to  specification_hash[:name] etc.
end

def echo_all(*args)
  args.each {|arg| puts arg}
end

def echo_at_least_two (first_arg, *middle_args, last_arg)
  puts "The first argument is #{first_arg}"
  middle_args.each {|arg| puts "A middle argument is #{arg}"}
  puts "The last argument is #{last_arg}"
end