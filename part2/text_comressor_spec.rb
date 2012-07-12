require "./text_compressor.rb"

describe TextCompressor do

  before :each do
    @c = TextCompressor.new('')
  end

  it "should be able to add text" do
    @c.add_text('first second')
    @c.unique_words.should == ["first", "second"]
    @c.index.should == [0, 1]
  end

  it "should be able to add a word" do
    @c.add_word('first')
    @c.unique_words.should == ['first']
    @c.index.should == [0]
  end


end