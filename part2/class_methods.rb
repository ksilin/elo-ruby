#class methods are an exampel of the practical application of singleton methods
require "../document"
# this variable is a reference to the Document class itself
my_obj = Document

# now lts redefine some methods for the Document class
def my_obj.explain # identical result to "def Document.explain"
  p "self : #{self}"

  # any givan class is an instance of Class
  p "self.class : #{self.class}"
end

my_obj.explain
# we can also access the newly defined method using the "original" Document class
Document.explain

class SomeClass
  # a syntax for defining class methods
  # they're just singelto methods on a Class object
  class << self
    def explain
      p "self : #{self}"
      p "self.class : #{self.class}"
    end
  end

  # this doesnt work neither as a class nor as an instance method
  def SomeClass explainMore
    p "no comment"
  end

   # this works as a class method
  def self.explainAgain
    p "not again"
  end

  #just a regular instance method
  def explain
    p "self: #{self}"
    p "self.class: #{self.class}"
  end
  p "self inside the class : #{self}"
end

SomeClass.explain
#SomeClass.explainMore #raises NoMethodError
SomeClass.new.explain
#SomeClass.new.explainMore #raises NoMethodError
#SomeClass.new.explainAgain #raises NoMethodError

p "SomeClass.instance_methods : #{SomeClass.instance_methods}"

# instance_methods works only for Class instances
# p "SomeClass.new.instance_methods : #{SomeClass.new.instance_methods}"
# p "SomeClass.new.self.explainAgain : #{SomeClass.new.self.explainAgain}" # raises a NoMethodError
p "SomeClass.explainAgain : "
SomeClass.explainAgain
# p "SomeClass.explainMore : #{SomeClass.explainMore}" # NoMethodError

# anther way to call clas methods having an instance :


#would it have the same effect to explicitly define the singelton methods on the self?

# the Date class uses class method ass multiple wellnamed ctors :
# Date.civil / Date.commercial etc

