#!/usr/bin/env ruby

require "rexml/document"

# find the author

File.open( 'fellowship.xml' ) do |f|
  doc = REXML::Document.new(f)
  author = REXML::XPath.first(doc,'/document/author')
  puts author.text
end

# find all chapter titles

File.open( 'fellowship.xml' ) do |f|
  doc = REXML::Document.new(f)
  REXML::XPath.each(doc,'/document/chapter/title') do |title|
    puts title.text
  end
end

