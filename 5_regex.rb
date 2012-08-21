# \d will match any digit, so that \d\d will match any two digit number from 00 to 99
# \w, where the w stands for “word character,” will match any letter, number or the underscore.
# \s will match any white space character including the vanilla space, the tab, and the newline.
  require "pp"

#matching a simle time string
puts /\d\d:\d\d (AM|PM)/ =~ '10:24 PM' # prints 0 - the pattern is matching startng with the very first char of the string

pp /PM/ =~ '10:24 PM' # 6
pp /AM/ =~ '10:24 PM' # nil

#doesnt matter if the regex or the string comes first
pp '10:24 AM' =~ /AM/

#case sens by default   , use 'i' to make insensitive
pp '10:24 am' =~ /AM/   # nil
pp '10:24 am' =~ /AM/i  # 6

#find all elements of an array by regex
a = %w{555-555-5555 666.666.6666}
pp a.find_all{|item| item =~ /\d{3}-\d{3}-\d{4}/ }