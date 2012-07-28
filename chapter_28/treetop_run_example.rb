# previously, you need tu install the treetop gem and run
# $ tt ez_ripper_statement.tt


require 'treetop'
require './ez_ripper_statement.rb'

statement =  "replace '/document/author' 'Russ Olsen'"
parser = EzRipperStatementParser.new
parse_tree = parser.parse( statement )

puts parse_tree.inspect