require_relative 'document.rb'

# define the explain method over a Document instance

my_object = Document.new('War and Peace','Tolstoy','All happy families...')

def my_object.explain
  puts "self is #{self}"
  puts "and its class is #{self.class}"
end

my_object.explain


# define the explain method over the Document class

my_object = Document

def my_object.explain
  puts "self is #{self}"
  puts "and its class is #{self.class}"  
end

my_object.explain


# define the explain method on Document explicitly

def Document.explain
  puts "self is #{self}"
  puts "and its class is #{self.class}"  
end

Document.explain