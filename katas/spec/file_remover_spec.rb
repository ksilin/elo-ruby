require "rspec"
require_relative "../FileRemover"

#create a temp dir as fixture, put fixture files in it and test on them

describe FileRemover do

  DIR_NAME = File.join(Dir.getwd, "temp")
  FILE_NAME = File.join(DIR_NAME, "tempfile")

  before(:each) do

    Dir.mkdir(DIR_NAME, 0777) unless Dir.exists?(DIR_NAME)

    # if the file exists, open it, if not - create it
    # File open is a synonym of #file.new if no block is given
    # f = File.exists?(FILE_NAME)? File.open(FILE_NAME, "w+") : File.new(FILE_NAME, "w+")
    # the opened file will be closed a t the end of the block

    for i in 1..20
      File.open(FILE_NAME + i.to_s, "w+") { |file| file.write(get_bytes i)
      p "created file of size: #{file.size}" }
    end
  end

  describe "Removing files up to a certain size" do

    it "should leave all files with sizes equal or bigger than the limit untouched" do

      #TODO : capture script output from puts?
      before = Dir.entries DIR_NAME
      FileRemover.remove DIR_NAME, 10
      # 13 = 2 directory entries, 1 file of exactly the specified size, 10 bigger files
      Dir.entries(DIR_NAME).size.should == 13
    end
    it "should leave all files as they are if size lmit is 0" do
      before = Dir.entries DIR_NAME
      FileRemover.remove DIR_NAME, 0
      Dir.entries(DIR_NAME).should == before
    end
    it "should remove all files if size lmit is bigger then all files" do
      FileRemover.remove DIR_NAME, 100
      # the directory contains only the currant and parent dir entries
      Dir.entries(DIR_NAME).should == [".", ".."]
    end
    it "should quit with an errror message if the specified direcory does not exist" do
      FileRemover.remove DIR_NAME, 100
    end
  end

  def get_bytes how_many
    r = ""
    how_many.times { r +="x" }
    r
  end

end
