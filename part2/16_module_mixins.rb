# the principle purpose on mixins is to provide same functionality to separate inheritance hierarchies

# how does ruby does mixins?

# Ruby rewires the class hierarchy a bit, inserting the module as a sort of pseudo superclass of the
# class. the module gets interposed between the class and its original superclass.

# despite the trick, ".class" will always remain intact. One can proof for the includede mixins with "kind_of?"
# or get the complete hierarchy, with modules and classes alike : "ancestors"

#one can do lots with a module - DataMapper is a module
#module are also convenient for sttoring constants

module WritingQuality

  CLICHES = [/play fast and loose/,
             /make no mistake/,
             /does the trick/,
             /off and running/,
             /my way or the highway/]

# note thea the method is a regular instance method, not a module-instance method
  def number_of_cliches
    CLICHES.inject(0) do |count, phrase|
      count += 1 if phrase =~ content
      count
    end
  end
end

class RegularBook
  include WritingQuality

  attr_accessor :content

  def initialize
    @content = "play fast and loose"
  end
end

#if the class needs a module on the class level, include the module with the class singleton instance as ctx
# ruby offers a shortcut for that - "extends"  p 197

# the precedence, in case a class includes multiple modules, is defined lexically
# by the order of the include statements - the last includede module wins

class EBook
  #the shortcut way
  extend WritingQuality

  #the verbose way
  class << self
    include WritingQuality
  end

  attr_accessor :content

  def initialize
    @content = "play fast and loose"
  end
end


book = RegularBook.new
p book.number_of_cliches
p RegularBook.ancestors
