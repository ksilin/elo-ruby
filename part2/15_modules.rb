# Ruby module is the container part of a class without the factory. You can’t
# instantiate a module, but you can put things inside of a module

# modules ca hold other classes, effectively creating a namespace
# or module-wide constants

# increasing the usability of modules as namespaces is the open nature of ruby objects,
# allowing to define modules in multiple files

# as a rule of thumb, i fyou find youself starting many classes with the same name, it's time to think about
# making that prefix a module name

module Render

  # lexical scoping - the class is declared below the constant and is not visible yet
  # DEFAULT_FONT = Font.new("default") would not work here

  class Font
    attr_accessor :font

    def initialize(font)
      @font = font
    end

    DEFAULT_FONT = Font.new("default")

    #when defining utility methods, go with module level methods, not regular methods
    # important - use 'self' !
    # these methods can be accessed liek classes over the namespace: Render::points_to_inches
    # but mostly, programmers prefer to call them with hte dot: Render.points_to_inches
    def self.points_to_inches(points)
      points/72.0
    end

    def self.inches_to_points(inches)
      inches*72.0
    end
  end
end

# modules define a namespace, nested modules define nested namespaces
p "Render::Font.new('bla').font: #{Render::Font.new("bla").font}"
p "default font : #{Render::DEFAULT_FONT}"

# modules can be used as objects, e.g. to switch behaviour at runtime
# here we could be using different modules defining different fonts
# for elaborated advantages, look @p. 187
the_module = Render
p the_module::Font.new('times-new-roman').font


