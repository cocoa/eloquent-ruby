require_relative 'document.rb'


describe "Document" do
 
  before(:each) do
    @test = 'A bunch of words'
    @doc = Document.new('test','nobody',@test)
  end

  it 'should hold on the contents' do
    @doc.content.should == @test
  end

  it 'should know wich words it has' do
    @doc.words.should include('A')
    @doc.words.should include('bunch')
    @doc.words.should include('of')
    @doc.words.should include('words')
  end

  it 'should know how many words it contains' do
    @doc.word_count.should == 4
  end

  after(:each) do
    # not implemented
  end

end