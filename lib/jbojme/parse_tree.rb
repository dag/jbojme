require 'jbojme/cmavo'
require 'jbojme/cmevla'
require 'jbojme/gismu'
require 'jbojme/lujvo'

module Jbojme
  class ParseTree < Array
    def initialize(text)
      @v = /[aeiouy]/
      @c = /[bcdfgjklmnprstvxz]/

      tree = text.split(/[\.\s]+/).map do |token|
        case token
        when /^(?:#@v(?:'?#@v)?|#@c#@v(?:'?#@v)?)+$/
          [:cmavo, token]
          Cmavo.new(token)
        when /#@c$/
          [:cmevla, token]
          Cmevla.new(token)
        when /^#@c(?:#@c#@v#@c|#@v#@c#@c)#@v$/
          [:gismu, token]
          Gismu.new(token)
        when /^#@c.*#@v$/
          [:lujvo, token]
          Lujvo.new(token)
        end
      end

      self.merge!(tree)
    end
  end
end
