require "rspec"
require_relative "../FileRemover"

#create a temp dir as fixture, put fixture files in it and test on them

describe FileRemover do
  describe "Removing files up to a certain size" do

    it "should open a directory and list contained files and directories with their sizes" do
      FileRemover.remove "/home/kostja/Code/Ruby", 56000
    end
    it "should display a usage message if no directory has been specified and quit"
    it "should quit with an errror message if the specified direcory does not exist"
    it "should open a directory and list contained files"

  end
end
