#!/usr/bin/env ruby
require 'csv'
_in = ARGV[0]
_out = ARGV[1]
# _in = "/Users/zemagno/Downloads/DistributionGroupMembers.csv"
dados = CSV.read(_in).to_a
final = []
erros = []
dados.shift
dados.each do |r|
  begin
    final << [r[3].gsub(/@.*/,""),r[0]]
  rescue
    erros << r
  end
end
final2 = []
final.group_by { |x| x[0] }.each do |k,v|
  final2 << [k,v.map {|x| x[1]}.join(";")]
end

CSV.open(_out, "wb") do |csv|
	final2.each do |l|
		csv << l
	end
end