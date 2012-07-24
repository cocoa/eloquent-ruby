require "rexml/document"


class XmlRipper

  def initialize( &block )
    @before_action = proc {}
    @after_action = proc {}

    @path_actions = {}
    # block.call( self ) if block
    instance_eval( &block ) if block
  end

  def initialize_from_file( path )
    self.instance_eval( File.read( path ) )
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

  # method missing

  def method_missing(name, *args, &block)
    return super unless name.to_s =~ /on_.*/
    parts = name.to_s.split('_')
    parts.shift
    xpath = '/' + parts.join('/')
    on_path(xpath, &block)
  end

end



# use cases

ripper = XmlRipper.new do |r|
  on_path( '/document/author' ) { |a| puts a.text }
  on_path( '/document/chapter/title' ) { |t| puts t.text }
end

ripper.run( 'fellowship.xml' )



#

ripper = XmlRipper.new do |r|
  on_path( '/document/author' ) do |author|
    author.text = 'J.R.R. Tolkien'
  end
  after { |doc| puts doc }
end

ripper.run( 'fellowship.xml')


#

ripper = XmlRipper.new
ripper.initialize_from_file( 'fix_author.ripper' )
ripper.run( 'fellowship.xml' )