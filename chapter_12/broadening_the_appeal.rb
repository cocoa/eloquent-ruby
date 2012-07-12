require_relative 'document_identifier.rb'
require_relative 'document_pointer.rb'

doc_id =  DocumentIdentifier.new( 'contracts', 'Book Deal' )
con_id =  ContractIdentifier.new( 'contracts', 'Book Deal' )

puts "They are equal!" if doc_id == con_id

# another example

doc_id = DocumentIdentifier.new( 'secret/area51', 'phone list' )
pointer = DocumentPointer .new('secret/area51', 'phone list' )

puts "They are equal TOO!" if pointer == doc_id   # True!!

