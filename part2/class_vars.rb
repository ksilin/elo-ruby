
# clss variables seem to be a good way to store class-related info, but they have a problem -
# due to the (actually reasonable) lookup strategy in combination with inheritance
# they tend to "wander" between classes on lookup

class Paper

      # to resolve the definition of the @@default_size, compile first looks at the current class,
    # if not found, it walks up the inheritance tree - if not found in the tree,
    # a new variable is created inside the current class
  @@default_size = :a4;

  def default_size
    @@default_size
  end

  def default_size=(new_size)
    @@default_size = new_size
  end

  attr_accessor :paper_size

  def initialize
    # to resolve the reading access to the @@default_size, compile first looks at the current class,
    # if not found, it walks up the inheritance tree - if not found in the tree,
    # a Name exception is thrown
    @paper_size=@@default_size
  end
end

# making matters worse with inheritance : demonstrating the class variabel wandering
class ResumePaper < Paper

end