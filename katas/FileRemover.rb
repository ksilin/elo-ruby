class FileRemover

  # the file remover is not recursive now - do it
  def self.remove(dir, max_size)

    begin
      d = Dir.entries(dir)
    rescue
      p "something went wrong while opening directory #{dir}"
    end

    d.each do |x|
      #disregard if not files
      next unless File.file?(dir + "/" + x)

        f = File.read(dir + "/" + x)
        p "found file #{x} of size #{f.size},"
        ##{ x.to_path}   #{x.lstat}  #{x.fileno}
    end
    # rescue of directory name is not given or broken

  end
end


