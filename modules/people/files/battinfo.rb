#!/usr/bin/env ruby
# encoding: utf-8

out = ''

pmset = `pmset -g ps`

if pmset =~ /'(.*)'/
  case $~[1]
  when 'AC Power'
    out += '⚡  '
  when 'Battery Power'
    out += '🔋  '
  end
end

out += "#{$~[1]} " if pmset =~ /(\d{1,3}%);/

out += $~[1] if pmset =~ /(\d+:\d+)/

puts out
