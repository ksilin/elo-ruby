class Doc
  # including enumerable and implementing each yields methods like "to_a", "find", "find_all"
  # if elements yielded by each implement "<=>" (which strings do), Enumerable also gives us "sort" and more
  include Enumerable

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
  # implementing the each method allows you to include Enumerable module to do all kinds of funky stuff
  def each_word_pair

    words = @content.split
    for i in 0..words.size - 2
        yield(words[i], words[i + 1])
    end
  end

  # including enumerable lets us use "each_cons"
  # it works like each, but applying the block to an array of consecutive elements of the specified size
  # the array "slides" along the each method, one element at a time
  # "each_split" does the same, but uses the size of the array as the stride  -
  # so effectively, "each_cons" is an "each_split" with a stride of 1
  def each_word_pair_cons
      # we operate on 2-word arrays now
      @content.split.each_cons(2) {|array| yield(array[0], array[1]) }
  end

  #in case we are sensitive to exceptions - for example if we need to close some resources at the end of the iteration:
  def yield_with_exception_handling

    p "opening expensive resource"

    begin
      p "yielding"
    yield "resource"
    # if yielding to a block will throw, the code inside ensure will run before throwing
    ensure
      p "closing expesive resource"
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

d.each_word_pair_cons do |w, x|
  p "pair : #{w}, #{x}"
end

# in case you have multiple iterating each-like methods, ruby provides the "Enumerator",
# so you can use a different iterating method with the gains of including Enumerable
enum = Enumerator.new(d, :each_word_pair_cons)

p enum.sort

#
#less desctructive alternative sto raise would be "break" or explicit "return"
d.yield_with_exception_handling do
  raise "kaboom!"
end



