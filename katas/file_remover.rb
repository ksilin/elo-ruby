class FileRemover

  def self.remove(dir, min_size)
    remove dir, min_size, true
  end

  # the file remover is not recursive now - do it
  def self.remove(dir, min_size, recursive)
    p "removing files in directory #{dir} smaller than #{min_size} bytes"

    begin
      file_names = Dir.entries(dir)
    rescue
      raise "something went wrong while opening directory #{dir}"
    end

    removed_files_counter = 0

    file_names.each do |x|
      file_name = File.join(dir, x)

      # if found a directory that is not . or .. - recurse
      if recursive and workable_dir? file_name
        p "found nested dir #{file_name}, recursing"
        remove(file_name, min_size, true)
      end

      #disregard if not files
      next unless File.file?(file_name)

      file = File.read(file_name)
      if file.size < min_size
        p "removing file #{x} of size #{file.size}"
        File.delete(file_name)
        removed_files_counter += 1
      end
    end

    # print summary
    p "removed #{removed_files_counter} from #{file_names.size} total files"
  end

  # returns true if the passed file name is a directory and the directory is not . or ..
  def self.workable_dir?(file_name)
    # assuming that all direcories anding with a dot are not of interest to us - to filter out the . and the ..
    # do not check the size
    #  matching - retuns nil not 0 if nothing matched - 0 means
    result = ((File.directory? file_name) and !(file_name =~ /\.\z/))
    p "#{file_name} is a regular nested dir: #{result}"
    result
  end
end


