require "rspec"
require_relative "../file_remover"

#create a temp dir as fixture, put fixture files in it and test on them

describe FileRemover do

  DIR_NAME = File.join(Dir.getwd, "temp")
  NESTED_DIR_NAME = File.join(DIR_NAME, "nested")
  FILE_NAME = File.join(DIR_NAME, "tempfile")
  NESTED_FILE_NAME = File.join(NESTED_DIR_NAME, "nestedtempfile")

  before(:each) do

    Dir.mkdir(DIR_NAME, 0777) unless Dir.exists?(DIR_NAME)
    Dir.mkdir(NESTED_DIR_NAME, 0777) unless Dir.exists?(NESTED_DIR_NAME)


    # if the file exists, open it, if not - create it
    # File open is a synonym of #file.new if no block is given
    # f = File.exists?(FILE_NAME)? File.open(FILE_NAME, "w+") : File.new(FILE_NAME, "w+")
    # the opened file will be closed a t the end of the block

    for i in 1..20
      File.open(FILE_NAME + i.to_s, "w+") { |file| file.write(get_bytes i)
      p "created file of size: #{file.size}" }
    end

    for i in 1..20
      File.open(NESTED_FILE_NAME + i.to_s, "w+") { |file| file.write(get_bytes i)
      p "created nested file of size: #{file.size}" }
    end
  end

  after(:each) do
    Dir.entries(DIR_NAME).each do |fname|
      file_path = File.join DIR_NAME, fname
      if File.file? file_path
        #p "deleting #{file_path}"
        File.delete file_path
      else
        #p " #{file_path} is no a file - not deleting"
      end
    end
    Dir.entries(NESTED_DIR_NAME).each do |fname|
      file_path = File.join NESTED_DIR_NAME, fname
      if File.file? file_path
        #p "deleting #{file_path}"
        File.delete file_path
      else
        #p " #{file_path} is no a file - not deleting"
      end
    end
    Dir.rmdir NESTED_DIR_NAME
    Dir.rmdir DIR_NAME
  end

  describe "Removing files up to a certain size" do

    it "should leave all files with sizes equal or bigger than the limit untouched" do

      before = Dir.entries DIR_NAME
      FileRemover.remove DIR_NAME, 10, true
      # 13 = 2 directory entries, 1 file of exactly the specified size, 10 bigger files
      Dir.entries(DIR_NAME).size.should == 14
    end
    it "should leave all files as they are if size lmit is 0" do
      before = Dir.entries DIR_NAME
      FileRemover.remove DIR_NAME, 0, true
      Dir.entries(DIR_NAME).should == before
    end
    it "should remove all files if size lmit is bigger then all files" do
      FileRemover.remove DIR_NAME, 100, true
      # the directory contains only the currant and parent dir entries
      Dir.entries(DIR_NAME).should == [".", "..", "nested"]
    end
    it "should quit with an errror message if the specified direcory does not exist" do
      d = :missing_dir
      expect {
        FileRemover.remove d, 100, true }.to raise_error ("something went wrong while opening directory #{d}")
    end
    it "should follow nested directories and remove the files if prompted"
    it "should not follow nested directories if recursion is switched off"
  end

  def get_bytes how_many
    r = ""
    how_many.times { r +="x" }
    r
  end

end
