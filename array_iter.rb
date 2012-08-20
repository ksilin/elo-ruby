require 'pp'

#arrays with strings  -> literal shortcuts

poem_words = ['wef', 'ergar', 'aerg', 'erte']
p poem_words
#same wihtout semicolons and commas
poem_words = %w{wef ergar aerg erte}
p poem_words

#iteration with each
poem_words.each { |word| p word }
#find index of a certain entry
p poem_words.find_index { |w| "aerg" == w }

def average_word_length(words)
  total = 0.0
  words.each { |word| total += word.size }
  total / words.length
end

#use inject to keep a control variable through the iterations
def average_word_length_improved words
  total = words.inject(0.0) { |result, word| word.size + result }
  total / words.length
end

p average_word_length(poem_words)
p average_word_length_improved(poem_words)

#the 1.9 way
def numeric_array_total arr
arr.inject(:+)
end
p "numeric array total :  #{numeric_array_total [1, 2, 3, 4, 5]}"

#introduce a method returning the index of a word in an array - no need to iterate eith each, use the built-in find_index method
def index_for(word)
  poem_words.find_index { |this_word| word == this_word }
end

#utility method for transforming an array into a new array -> map
#here to map an arryo of words into an array of the lengths of these words
def word_lengths (words)
  words.map {|w| w.size }
end

p word_lengths poem_words

#watch out when using interator methods for destructively removing elements
#removing all negative numbers fails
array = [ 0, -10, -9, 5, 9 ]
array.each_index {|i| array.delete_at(i) if array[i] < 0}
pp array

#clean way
array.delete_if {|i| i < 0}

#filter an array - returns a new array containing all positive members of array
array.collect { |i| i > 0}


