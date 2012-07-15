# method definition

def do_something
  yield if block_given?
end

do_something { puts "Hello from inside the block 1" }

do_something do 
  puts "Hello from inside the block 2"
end


# blocks can take arguments

def do_something_with_an_arg
  yield("Hello world 3") if block_given?
end

do_something_with_an_arg do |message|
  puts "The message is: #{message}"
end


# blocks also return values

def print_the_value_returned_by_the_block
  if block_given?
    value = yield
    puts "The block returned #{value}"
  end
end

print_the_value_returned_by_the_block { 3.14159 / 4.0 }
