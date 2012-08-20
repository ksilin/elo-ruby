# Ruby module is the container part of a class without the factory. You can’t
# instantiate a module, but you can put things inside of a module

# modules ca hold other classes, effectively creating a namespace
# or module-wide constants

module Render

  # lexical scoping - the class is declared below the constant and is not visible yet
  # DEFAULT_FONT = Font.new("default") would not work

  class Font
    attr_accessor :font

    def initialize(font)
      @font = font
    end

    #when defining utility methods, go with module level methods, not regular methods
         # important - use 'self' !
    def self.points_to_inches(points)
      points/72.0
    end
  end

  # see lexical scoping
  DEFAULT_FONT = Font.new("default")
end

# modules define a namespace, nested mosules define nested namespaces
p Render::Font.new("bla").font

# modules can be used as objects, e.g. to switch behaviour at runtime
# here we could be using different modules defining different fonts
the_module = Render
p the_module::Font.new('times-new-roman').font


