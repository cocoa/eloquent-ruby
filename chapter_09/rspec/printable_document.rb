require_relative "document.rb"

class PrintableDocument < Document 

  def print (printer)
    return 'Printer Unavailable' unless printer.available?

    printer.render("#{title}\n")
    printer.render("by #{author}\n")
    printer.render( content )

    'Done'
  end

end