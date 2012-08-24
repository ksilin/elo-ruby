# execute round wiht blocks
# use a code block to interleave some standard bit of processing with whatever
# it is that the block does

# yield with blocks can also be used to initialize objects (p 225)

# also see the part about block scope (closure) - p 226 - everythig visible before the
# opening "do" of the block is visible to the block wherever it is executed


module Lo
  require "logger"

  def self.do_stuff

    with_log ("opening expensive resource") { p "opening"}
    with_log ("failing") { raise "opening"}
    # will raise if no block given
    with_log ("continuing")

  end

  def self.with_log (description)

    log = Logger.new "log.txt"

    log.info("starting #{description}")
    # capturing the result of the block (p 227)
    result = yield
    log.debug("finished #{description}")
    result
  rescue
    log.debug("#{description} failed")
    raise
  end
end

Lo.do_stuff