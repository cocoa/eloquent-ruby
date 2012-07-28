require './xmlripper.rb'

class EzRipper

  def initialize(program_path)
    @ripper = XmlRipper.new
    parse_program(program_path)
  end

  def run(xml_file)
    @ripper.run(xml_file)
  end

  def parse_program(program_path)
    File.open(program_path) do |f|
      until f.eof?
        parse_statement(f.readline)
      end
    end
  end

  def parse_statement(statement)
    statement = statement.sub(/#.*/,'')   # strip out all comments
    tokens = statement.strip.split
    return if tokens.empty?

    case tokens.first
    when 'print'
      raise "Expected print <xpath>" unless tokens.size == 2    # more detailed error information
      @ripper.on_path(tokens[1]) {|el| puts el.text}

    when 'delete'
      raise "Expected delete <xpath>" unless tokens.size == 2
      @ripper.on_path(tokens[1]) {|el| el.remove}

    when 'replace'
      unless tokens.size == 3
        raise "Expected replace <xpath> <value>"
      end
      @ripper.on_path(tokens[1]) {|el| el.text = tokens[2]}

    when 'print_document'
      raise "Expected print_document" unless tokens.size == 1
      @ripper.after {|doc| puts doc}

    # the available DSL language can be extended easily...
    when 'uppercase'
      raise "Expected uppercase <xpath>" unless tokens.size == 2
      @ripper.on_path(tokens[1]) {|el| el.text = el.text.upcase}
  
    else
      raise "Unknown keyword: #{tokens.first}"
    end
  end
end



# examples

# EzRipper.new('edit.ezr').run('fellowship.xml')


