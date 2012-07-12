require_relative 'document_identifier.rb'

first_id = DocumentIdentifier.new('secret/plans','raygun.txt')
second_id = DocumentIdentifier.new('secret/plans','raygun.txt')

puts "They are equal!" if first_id == second_id