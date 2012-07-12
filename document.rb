class Document

  attr_accessor :title
  attr_accessor :author
  attr_accessor :content

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
  end

  def words
     @content.split
  end

  def word_count
    @content.split.length
  end

  def print printer

    raise 'Printer unavailable' unless printer.available?

    printer.render @title
    printer.render "by #{@author}"
    printer.render @content
    'Done'
  end


end