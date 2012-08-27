class FileRemover

  # the file remover is not recursive now - do it
  def self.remove(dir, max_size)
    p "removing files in direcoty #{dir} smaller than #{max_size} bytes"
    begin
      d = Dir.entries(dir)
    rescue
      raise "something went wrong while opening directory #{dir}"
    end

    d.each do |x|
      #disregard if not files
      file_name = File.join(dir, x)
      next unless File.file?(file_name)


      file = File.read(file_name)
      if file.size < max_size
        p "removing file #{x} of size #{file.size}"
        File.delete(file_name)
      end
    end
    # rescue of directory name is not given or broken

  end
end


