class DocumentPointer
  attr_reader :folder, :name

  def initialize(folder, name)
    @folder = folder
    @name = name
  end


  # a duck-type definition of the == method - we just check if the other object has appropriate props
  def ==(other)
    return false unless other.respond_to?(:folder)
    return false unless other.respond_to?(:name)
    folder == other.folder && name == other.name
  end
end