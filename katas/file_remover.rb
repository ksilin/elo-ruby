class FileRemover

  def self.remove(dir, min_size)
    remove dir, min_size, true
  end

  # the file remover is not recursive now - do it
  def self.remove(dir, min_size, recursive)
    p "removing files in directory #{dir} smaller than #{min_size} bytes"

    begin
      d = Dir.entries(dir)
    rescue
      raise "something went wrong while opening directory #{dir}"
    end

    removed_counter = 0

    d.each do |x|
      file_name = File.join(dir, x)

      # if found a directory that is not . or .. - recurse

      if recursive and workable_dir? file_name
        p "found nested dir #{file_name}, recursing"
        remove file_name, min_size, recursive
      end

      #disregard if not files
      next unless File.file?(file_name)

      file = File.read(file_name)
      if file.size < min_size
        p "removing file #{x} of size #{file.size}"
        File.delete(file_name)
        removed_counter += 1
      end
    end

    p "removed #{removed_counter} from #{d.size} total files"
  end

  def self.workable_dir?(file_name)
    # assuming that all direcories anding with a dot are not of interest to us - to filter out the . and the ..
    # do not check the size

    (File.directory? file_name) and (file_name =~ /\.\z/) == 0
  end
end


