# a passed block cam be tested for
def do_sth
  yield if block_given?
end

# the yielding code can pass arguments
def do_sth_with_arg
  yield "Yielding a string" if block_given?
end

# the yielding code can pass arguments
def do_sth_with_arg_and_return
  value = yield "Yielding a string" if block_given?
  p value
end

#does nothing
do_sth

# the block is passed as an implicit var
do_sth {
  p "passed block"
}

do_sth_with_arg do |arg|
  p arg
end

do_sth_with_arg_and_return do |arg|
  p arg
  "giving something back"
end




