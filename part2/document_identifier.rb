class DocumentIdentifier
  attr_reader :folder, :name

  def initialize(folder, name)
    @folder = folder
    @name = name
  end

  def ==(other)
    return true if other.equal?(self) #shortcut if testing the same object

    #checking for the class of the othe object
    return false unless other.kind_of?(self.class) #instance_of? is stricter, not applying to derived classes
    folder == other.folder && name == other.name
  end

  def hash
    folder.hash ^ name.hash
  end

  #no shortcut, strict instance_of?
  def eql?(other)
    return false unless other.instance_of?(self.class)
    folder == other.folder && name == other.name
  end

end