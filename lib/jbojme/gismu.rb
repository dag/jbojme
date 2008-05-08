require 'jbojme/lists/gismu'

module Jbojme
  class Gismu
    attr_reader :gismu, :rafsi, :smuni, :skicu

    def initialize(gismu)
      data = GISMU_LIST.select {|g| g[0][0] == gismu.to_s.downcase }[0]
      @gismu = data[0][0]
      @rafsi = data[0][1..-1]
      @smuni = data[2]
      @skicu = data[3]
    end
  end
end
