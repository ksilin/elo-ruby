# the proper solution to the wandering class variables is to use regular instance variables with the class object

# see pp 174ff

class Paper

  @default_font = :times

    # the difference is in the magic word "self", which in this ctx refers to the class instance
  def self.default_font
    @default_font
  end

  def self.default_font=(new_font)
    @default_font = new_font
  end

  attr_accessor :font

  def initialize
    @font = Paper.default_font
  end
end

#this approach works just fine with subclasses since there is no vetical lookup -
# the var is bound to the actual class instance
# the order of require statements does not change the setting

class Resume

  @default_font = :arial

  # in order to use the usual attr_accessors, as they are tied to the self,
  # first assure that the self is currently the Resume singleton class:

  class << self
    attr_accessor :default_font
  end

  #this construct is widely used in ruby& rails for setting up callbacks e.g. on ActiveRecord
  # @after_save_calbacks is a member of the ActiveRecord class


  attr_accessor :font

  def initialize
    @font = Resume.default_font
  end
end




