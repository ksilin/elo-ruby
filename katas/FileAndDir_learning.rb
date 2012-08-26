# use backticks to execute shell commands
puts `find . | grep -i a`

p Dir.getwd

dir_name = File.join(Dir.getwd, "temp")

p "the directory exists: #{Dir.exists?(dir_name)}"


# returns 0 if successful
#you have to give the permissions as integer, otherwise you will not be permitted to write in the newly created dir
Dir.mkdir(dir_name, 0777) unless Dir.exists?(dir_name)
#create a file  - here the permissions have to be a string
# quite a dissonace between File and Dir here IMO
f = File.new(File.join(dir_name, "temp_file.txt"), "w+")
p "creating a new file: " + f.to_s
# dont let resources open
f.close





