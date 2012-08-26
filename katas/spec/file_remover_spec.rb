require "rspec"
require_relative "../FileRemover"

#create a temp dir as fixture, put fixture files in it and test on them

describe FileRemover do

  DIR_NAME = File.join(Dir.getwd, "temp")
  FILE_NAME = File.join(DIR_NAME, "tempfile")

  before(:each) do

    Dir.mkdir(DIR_NAME, 0777) unless Dir.exists?(DIR_NAME)

    # i fthe file exists, open it, if not - create it
    # File open is a synonym of #file.new if no block is given
    # f = File.exists?(FILE_NAME)? File.open(FILE_NAME, "w+") : File.new(FILE_NAME, "w+")
    # the opened file will be closed a t the end of the block
    File.open(FILE_NAME, "w+") { |file| file.write(:sfeaefawefawefawefawefawefawefawefawegawecwaec)
    p "created file of size: #{file.size}" }
  end

  describe "Removing files up to a certain size" do

    it "should open a directory and list contained files and directories with their sizes" do
      FileRemover.remove "/home/kostja/Code/Ruby", 56000
    end
    it "should display a usage message if no directory has been specified and quit"
    it "should quit with an errror message if the specified direcory does not exist"
    it "should open a directory and list contained files"

  end
end
