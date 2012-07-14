module Rendering

  class Font
    attr_accessor :name, :weight, :size

    def initialize(name, weight=:normal, size=10)
      @name = name
      @weight = weight
      @size = size
    end

    # rest of the class omited
  end


  class PaperSize
    attr_accessor :name, :weight, :size

    def initialize(name='US Let', width=8.5, height=11.0)
      @name = name
      @weight = weight
      @size = size
    end

    # rest of the class omited
  end


  DEFAULT_FONT = Font.new('default')
  DEFAULT_PAPERSIZE = PaperSize.new

end