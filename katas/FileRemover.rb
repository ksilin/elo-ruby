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
      file_name = File.join(dir, x)
      next unless File.file?(file_name)

      #p "found file #{x} of size #{f.size},"

      if File.read(file_name).size < max_size
        File.delete(file_name)
      end
    end
    # rescue of directory name is not given or broken

  end
end


