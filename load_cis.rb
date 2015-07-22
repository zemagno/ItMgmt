#!/usr/bin/env ruby
require 'csv'
arquivo =  ARGV[0]

file = File.read(arquivo)
params = JSON.parse(File.read(arquivo))

puts data_hash

config["default"].each do |k,v|
 puts k,v
end
