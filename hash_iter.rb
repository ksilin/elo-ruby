#hash with strings  -> literal shortcuts

poem_words = {'wef' => 123, 'ergar' => 124, 'aerg' => 1235, 'erte'=> 124}
p poem_words

# with symbols as keys, it boils down to this (1.9 and up)):
poem_words = {wef: 123, ergar: 124, aerg: 1235, erte: 124}
p poem_words

#iterate
poem_words.each {|w| p w}
poem_words.each {|key, value| p "#{key} <X> #{value}"}

#find index of a certain entry
p poem_words.find_index { |key, val| :aerg == key }