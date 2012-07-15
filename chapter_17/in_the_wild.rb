puts "Contents of /etc directory:"
etc_dir = Dir.new('/etc')
etc_dir.each {|name| puts name}


require 'resolv'
Resolv.each_address("www.lavoz.es") { |ip| puts ip }


# ObjectSpace.each_object(String) { |the_string| puts the_string }


require 'mathn'
Prime.each { |x| puts "The next prime is #{x}" }
