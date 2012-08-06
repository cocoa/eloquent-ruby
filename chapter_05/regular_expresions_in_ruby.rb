the_time = '10:24 PM'

puts /\d\d:\d\d (AM|PM)/ =~ the_time # 0

puts /PM/ =~ the_time # 6


# if there is not match, it will return nil
may_match = /May/ =~ 'Sometime in June'
puts may_match.inspect


# =~ operator is ambidextrous
puts "It's not morning!" if /PM/ =~ the_time
puts "It's not morning!" if the_time =~ /PM/


# you can turn case sensitivity OFF
puts "It matches!" if /AM/i =~ 'am'


# obscure_times! method
class Document
  attr_accessor :content

  def initialize(content)
    @content = content
  end

  def obscure_times!
    @content.gsub!( /\d\d:\d\d (AM|PM)/i , '**:** **')
  end
end

oclock = Document.new('12:00 am').obscure_times!
puts oclock
