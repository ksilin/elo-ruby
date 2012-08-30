#!/usr/bin/env ruby
require_relative "file_remover"

begin

  unless ARGV.length == 2
    puts "Usage: removeFiles.rb directory_name min_file_size"
    exit
  end

  puts "The script was passed: "
  ARGV.each do |value|
    puts value
  end

  #TODO :how to parse a string to an integer?
  FileRemover.remove(ARGV[0], Integer(ARGV[1]))
end