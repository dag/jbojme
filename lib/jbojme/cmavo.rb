require 'jbojme/lists/cmavo'

module Jbojme
  class Cmavo
    attr_reader :cmavo, :selmaho, :smuni, :skicu

    def initialize(cmavo)
      data = CMAVO_LIST.select {|c| c[0] == cmavo.to_s.downcase }[0]
      @cmavo = data[0]
      @selmaho = data[1]
      @smuni = data[2]
      @skicu = data[3]
    end
  end
end
