#!/usr/bin/env ruby

begin

  puts "The script was passed: "
  ARGV.each do |value|
    puts value
  end

  FileRemover.remove(ARGV[0], ARGV[1])
end