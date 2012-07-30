require './document.rb'
require './writing_quality_module.rb'

# mix in the module

class Document
  include WritingQuality
end

text = "my way or the highway does the trick"
my_tome = Document.new('Hackneyed', 'Russ', text)
puts my_tome.number_of_cliches

# puts my_tome.inspect
# puts WritingQuality.instance_methods(false)
# puts Document.ancestors