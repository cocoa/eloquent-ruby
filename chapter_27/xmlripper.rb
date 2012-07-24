require "rexml/document"


class XmlRipper
  def initialize( &block )
    @before_action = proc {}
    @after_action = proc {}

    @path_actions = {}
    block.call( self ) if block
  end


  def on_path( path, &block )
    @path_actions[path] = block
  end

  def before( &block )
    @before_action = block
  end

  def after( &block )
    @after_action = block
  end

  def run( xml_file_path )
    File.open(xml_file_path) do |f|
      document = REXML::Document.new(f)
      @before_action.call( document )     # is a block
      run_path_actions( document )
      @after_action.call( document )      # is a block
    end
  end

  def run_path_actions( document )
    @path_actions.each do |path, block|
      REXML::XPath.each( document, path ) do |element|
        block.call( element )
      end
    end
  end

end



# use cases (1/2)

ripper = XmlRipper.new do |r|
  r.on_path( '/document/author' ) { |a| puts a.text }
  r.on_path( '/document/chapter/title' ) { |t| puts t.text }
end

ripper.run( 'fellowship.xml' )



# (2/2)

ripper = XmlRipper.new do |r|
  r.on_path( '/document/author' ) do |author|
    author.text = 'J.R.R. Tolkien'
  end
  r.after { |doc| puts doc }
end

ripper.run( 'fellowship.xml')

