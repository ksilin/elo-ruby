class Doc

  attr_accessor :content

  def initialize
    @content = "dolor sic amet bli bla bblup"
  end

  # creating an iterator method with yield
  # the ruby convention is to call your main iterator "each"
  def each
    @content.split.each do |w|
      yield(w)
    end
  end

  # note that the iterator methods can be created to simulate collections that are not there
  # here - to iterate over word pairs
  def each_word_pair

    words = @content.split
    for i in 0..words.size - 2
        yield(words[i], words[i + 1])
    end
  end

end

d = Doc.new

d.each do |w|
  p w
end

d.each_word_pair do |w, x|
  p "pair : #{w}, #{x}"
end
