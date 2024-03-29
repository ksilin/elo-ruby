#hand made stubs - works exactly like rspec
# stub_font = stub :size => 14, :name => 'Courier'

# Singleton methods override any regular, class-defined methods
# except for instances of the numeric classes and symbols, neither of which sup-
# ports singleton methods

# if you are using class methods (singleton methods of instances of Class)
# unlike in java, the instances of the class will not know those methods  -> TODO : example

#plain object for stubbing
hand_built_stub_printer = Object.new
# stub query
def hand_built_stub_printer.available?
  true
end
#stub processing
def hand_built_stub_printer.render(content)
  nil
end
#test method availability
p hand_built_stub_printer.available?
p hand_built_stub_printer.render 'kugug'

#---
# here the .class method of a random object is overridden to prevent returning the class
uncooperative = "Don't ask my class"

def uncooperative.class
  "I'm not telling"
end

puts uncooperative.class


# Singleton (metaclass)
singleton_class = class << hand_built_stub_printer
  self
end

p singleton_class


