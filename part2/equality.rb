#Ruby’s Object class defines no
#less than four equality methods. There is eql? and equal? as well as == (that’s two
#equal signs), not to mention === (that’s three equal signs)

#Ruby uses the 'equal?' method to test for object identity

#the default implementation of ==, the one that
#DocumentIdentifier inherits from Object, does the same thing as equal?

require "./document_identifier.rb"
require "./document_pointer.rb"

#unrelated class, can be compared to DocId with it's ducktypish == operator

doc_id = DocumentIdentifier.new('secret/area51', 'phone list')
pointer = DocumentPointer.new('secret/area51', 'phone list')
#the == op is not symmetric across classes
p pointer == doc_id # True!!
p doc_id == pointer # False!!

# The main use for === is in case statements
#By default, === calls the double equals method, so unless you specifically override
#===, wherever you send ==, === is sure to follow

# instances of Fixnum or Bignum) will accept instances of Float as equals
# Ruby does this by converting the Fixnum to a Float before doing the comparison

#here, automatic conversion happens, so the result is true
puts 1 == 1.0

# spaceship <=>   the ruby comparator
# <=> should be consistent with ==.
# That is, if a <=> b evaluates to zero, then a == b should be true

# Comparable will not only add a == method to your class, but also <, <=, >=, and >
# all of which will rely on your <=> method to come up with the right answer


class RomanNumerals
  include Comparable
# Actual guts of the class omitted...
  def <=>(other)
# Return -1, 0, or 1...
  end
end


# Classes treat the === method as an alias for kind_of?

the_object = 3.14159 #It's a float'
case the_object
  when String
    puts "it's a string"
  when Float
    puts "It's a float"
  when Fixnum
    puts "It's a fixnum"
  else
    puts "Dunno!"
end

# another asymmetric relationship :
# Float is a Class, so it overrides === to test for kind_of equality
p Float === 1.0 #true
p 1.0 === Float #false








