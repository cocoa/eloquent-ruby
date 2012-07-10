require_relative "printable_document.rb"


describe "Printable Document" do 

  before(:each) do
    @text = 'A bunch of words'
    @doc = PrintableDocument.new('test','nobody',@text)
  end

  # stubs

  it 'should know how to print itself' do
    stub_printer = stub :available? => true, :render => nil
    @doc.print(stub_printer).should == 'Done'
  end

  it 'should return the proper string if printer is offline' do
    stub_printer = stub :available? => false, :render => nil
    @doc.print(stub_printer).should == 'Printer Unavailable'
  end
  
  # mocks

  it 'should know how to print itself (mock example)' do
    mock_printer = mock('Printer')
    mock_printer.should_receive(:available?).and_return(true)
    mock_printer.should_receive(:render).exactly(3).times
    @doc.print( mock_printer ).should == 'Done'
  end

end