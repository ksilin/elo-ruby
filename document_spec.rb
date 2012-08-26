require "./document.rb"

#this is a spec, it can be run from CLI by calling 'rspec' (spec on some systems) filename
# to run all spec recursively, use 'rspec .'

describe Document do

  before :each do
  @text = 'A bunch of words'
  @doc = Document.new( 'test', 'nobody', @text )

    #easy stubbing
    @printer_stub = stub :available? => true, :render => nil

  end

  #the teardown of rspec
  after :each do
    #nothing
  end


  it 'should hold on to the contents' do
    @doc.content.should == @text
  end

  it 'should return all of the words in the document' do
    @doc.words.include?('A').should == true
    @doc.words.include?('bunch').should == true
    @doc.words.include?('of').should == true
    @doc.words.include?('words').should == true
  end

  it 'should know how many words it contains' do
    @doc.word_count.should == 4
  end

  it 'should not include words that were not put in' do
    @doc.content.should match( /A bunch.*/ )
    @doc.words.should_not include 'doobie'
  end

  #easy mocking
  it 'should know how to print itself' do
  mock_printer = mock('Printer')
  mock_printer.should_receive(:available?).and_return(true)
  mock_printer.should_receive(:render).exactly(3).times
  @doc.print( mock_printer ).should == 'Done'
  end

  it "is just a demonstration of stubs as singleton methods" do
  pp @printer_stub.singleton_methods
  end



end
