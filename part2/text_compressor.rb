require 'pp'

class TextCompressor

  attr_accessor :unique_words, :index

  def initialize(text)

    @unique_words = []
    @index = []

    add_text(text)
  end

  def add_text(text)
    text.split.each { |word| add_word word }
  end

  def add_word word
    #i = @unique_words.index(word) || add_unique_word(word)
    @index << (@unique_words.index(word) || add_unique_word(word))
  end

  def add_unique_word word
    @unique_words << word
    @unique_words.size - 1
  end

end

#text = "This specification is the specification for a specification"
#compressor = TextCompressor.new(text)

#pp compressor.unique_words
#pp compressor.index

