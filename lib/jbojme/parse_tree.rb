require 'jbojme/cmavo'
require 'jbojme/gismu'

module Jbojme
  class ParseTree < Array
    def initialize(text)
      @v = /[aeiouy]/
      @c = /[bcdfgjklmnprstvxz]/

      tree = text.split(/[\.\s]/).map do |token|
        case token
        when /^(?:#@v(?:'?#@v)?|#@c#@v(?:'?#@v)?)+$/
          [:cmavo, token]
          Cmavo.new(token)
        when /#@c$/
          [:cmevla, token]
        when /^#@c(?:#@c#@v#@c|#@v#@c#@c)#@v$/
          [:gismu, token]
          Gismu.new(token)
        when /^#@c.*#@v$/
          [:lujvo, token]
        end
      end

      self.merge!(tree)
    end
  end
end
