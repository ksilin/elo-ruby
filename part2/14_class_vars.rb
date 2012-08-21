# clss variables seem to be a good way to store class-related info, but they have a problem -
# due to the (actually reasonable) lookup strategy in combination with inheritance
# they tend to "wander" between classes on lookup

# vertical global vars

# see pp 170ff

class Paper #in the book, class Documetn is used

  # to resolve the definition of a class var, compile first looks at the current class,
  # if not found, it walks up the inheritance tree - if not found in the tree,
  # a new variable is created inside the current class

  # not knowing (and who cares) that the class var has been added in deriving classes,
  # a @@default_font class var is defined in the parent class
  # now, as the parent class is loaded first, setting the class variable in the deriving classes will result in setting
  # the variable in the parent class with the result that the value of the class var actually
  # depends on class loading sequence, which is partially defined by the "require" state

  #require 'document'
  #require 'presentation' Load Presentation first
  #require 'resume'  then Resume
  # the now single instance of the class var is forst overriden by presentation then by the resume


  @@default_font = :times

    # there are no "shortcut" methods for providing accesprs to class vars
  def default_font
    @@default_font
  end

  def default_font=(new_font)
    @@default_font = new_font
  end

  attr_accessor :font

  def initialize
    # to resolve the reading access to the @@default_font, compiler first looks at the current class,
    # if not found, it walks up the inheritance tree - if not found in the tree,
    # a Name exception is thrown
    @font = @@default_font
  end
end

# making matters worse with inheritance : demonstrating the class variable wandering
# this class does not override the @@default_size
# the problem becomes more visible when the class var is defined: @@default_size = :a4
class ResumePaper < Paper

  @@default_font = :arial

  def default_font
    @@default_font
  end

  def default_font=(new_font)
    @@default_font = new_font
  end

  attr_accessor :font

  def initialize
    @font = @@default_font
  end
end

class PresentationPaper < Paper

  @@default_font = :nimbus

  def default_font
    @@default_font
  end

  def default_font=(new_font)
    @@default_font = new_font
  end

  attr_accessor :font

  def initialize
    @font = @@default_font
  end
end





