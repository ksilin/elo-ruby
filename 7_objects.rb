# "I am #{self}"
# "My title is #{self.title}"

# while Ruby’s system of controlling method visibility is
# perfectly respectable, it doesn’t get a lot of use. For example, if you look at the Ruby
# standard library you will find nearly 200,000 lines of code. In that huge pile of soft-
# ware, private appears just over 1000 times and protected only about fifty times.
# send overrides all visibility constraints  n = doc.send( :word_count )

require 'pp'

pp 3.public_methods

class Document
# Mostly omitted...
  def to_s
    "Document: #{title} by #{author}"
  end
end

class Person
  attr_accessor :salary # A method call
  attr_reader :name # Another method call
  attr_writer :password # And another

  def initialize(salary, name, password)
    @salary = salary
    @name = name
    @password = password
  end
end

pp Person.new(1000, "Igor", "secret")



p -3.abs # Returns 3

p /abc/.class # Regexp

p true.class
p nil.nil?

#ther most primitive irb emulator
def mycmd
  while true
    print "Cmd> "
    cmd = gets
    puts(eval(cmd))
  end
end

mycmd