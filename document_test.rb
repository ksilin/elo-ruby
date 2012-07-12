require 'test/unit'
require "./document.rb"

class TestDocument < Test::Unit::TestCase

  #framework - defined setup method - called around EACH test method
  # same for teardown
  def setup
    @text = "drsa rge rga e rgaga wega wg"
    @doc = Document.new "mytitle", "someauthor", @text
  end

  #test have to start wiht the word "test"
  def test_doc_holds_onto_contents
    p "testing doc contents as a whole"
    assert_equal @text, @doc.content, "contents are equal"
  end

  def test_assertions_showcase
    p "testing doc contents in depth"
    #assert @doc.words.include? 'bunch'

  end

  def test_contains
    p "testing doc contents in depth - positive"
    assert @doc.words.include? 'rga'
    assert_equal 7, @doc.word_count, 'Word count is not correct'

  end

  def test_assertion_zoo
    assert_match /times.*/, 'times new roman'
  end

end

