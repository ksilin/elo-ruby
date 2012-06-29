require 'pp'
#single-quotd strings are very literal - the only fancy thing they can do it escaping

s = 'ain\'t a simple string '
p s

#double-quoted strings can contain tabs and newlines

s = " tab: \t and... \n a newline!"
puts s
p s    # this does not seem to work - outputs verbatim
pp s   # this does not seem to work - outputs verbatim

#expression eval
author = "Ben Bova"
title = "Mars"
puts "#{title} is written by #{author}"
p "#{title} is written by #{author}"
#avoiding quotation escaping:
s =  %q{"Stop", she said, "I can't live without 's and "s."}
puts s
p s

#anythign can ba a delimiter in the quotation - the char after the %q
s =  %q$"Stop", she said, "I can't live without 's and "s."$

#usign %Q allows you to eval expressions in the strings
s = %Q<efewf #{title}>
puts s
p s

#sub replaces one occurence, gsub - all
puts 'yes yes'.sub( 'yes', 'no' )
puts 'yes yes'.gsub( 'yes', 'no' )

#detecting a substring
p 'wegfawereqaergaumawdnawef'.index('umaw')#15
p 'wegfawereqaergaumawdnawef'.index('xxxx')#returns nil

#for each char - theres also an 'each_line' method, but no 'each' (since 1.9)
'awerg'.each_char {|c| p c}
'awerg'.each_byte {|c| p c}

#splitting strings
  p 'we!gfawere!qaerg!auma!w!dnawef'.split('!')#15
