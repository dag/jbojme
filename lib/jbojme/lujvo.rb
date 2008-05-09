require 'jbojme/lists/lujvo'
require 'jbojme/gismu'

module Jbojme
  class Lujvo
    attr_reader :lujvo, :gismu, :smuni

    def initialize(lujvo)
      data = LUJVO_LIST.select {|l| l[0] == lujvo.to_s.downcase }[0]
      @lujvo = data[0]
      @gismu = data[1].map {|g| Gismu.new(g) }
      @smuni = data[2]
    end
  end
end
