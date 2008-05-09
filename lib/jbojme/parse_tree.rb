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
          cmavos = token.scan(/.(?:'|#@v)*/).map {|c| Cmavo.new(c) }
          cmavos.size > 1 ? cmavos : cmavos[0]
        when /#@c$/
          Cmevla.new(token)
        when /^#@c(?:#@c#@v#@c|#@v#@c#@c)#@v$/
          Gismu.new(token)
        when /^#@c.*#@v$/
          Lujvo.new(token)
        end
      end

      self.merge!(tree)
    end
  end
end
