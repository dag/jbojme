namespace :list do
  desc "Generate a gismu list reading standard input for logflash"
  task :gismu do
    require 'pp'
    list = STDIN.readlines[1..-1].map do |line|
      [
        line[0..19].split,
        line[20..40].strip,
        line[41..61].strip,
        line[62..-1].strip
      ]
    end
    puts "module Jbojme"
    puts "  GISMU_LIST ="
    puts list.pretty_inspect.split("\n").map {|line| "    %s" % line }.join("\n")
    puts "end"
  end

  desc "Generate a cmavo list reading standard input for logflash"
  task :cmavo do
    require 'pp'
    list = STDIN.readlines[1..-1].map do |line|
      [
        line[1..10].strip,
        line[11..19].strip,
        line[20..61].strip,
        line[62..167].strip,
        line[168..-1].to_s.strip
      ]
    end
    puts "module Jbojme"
    puts "  CMAVO_LIST ="
    puts list.pretty_inspect.split("\n").map {|line| "    %s" % line }.join("\n")
    puts "end"
  end
end
