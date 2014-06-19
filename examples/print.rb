# -*- encoding: utf-8 -*-
$:.unshift(File.join(File.dirname(__FILE__), "../lib"))
$:.unshift(File.join(File.dirname(__FILE__)))

require 'rescpos'
require 'reports/dish_item_report'
require 'reports/bill_list_report'
require 'reports/array_table_report'
require 'reports/consumer_code_report'
require 'faraday'
require 'json'

def get_cc(passwd, gid)
  conn = Faraday.new(:url => 'http://fp.memeing.cn')
  rep = conn.post '/api/mfp/cc_gets', { :passwd => passwd, :gid => gid }
  JSON.parse(rep.body)['results']
end

Rescpos.configure do |config|
  config.template_path = File.expand_path(File.join(File.dirname(__FILE__), 'escposes'))
end

printer = Rescpos::Printer.open("/dev/usb/lp0")

puts 'Enter Password:'
passwd = gets.chomp

puts 'Enter Group ID:'
gid = gets.chomp

ccs = get_cc passwd, gid

ccs.each do |cc|
  code = cc['code']
  group = cc['consumer_code_group_id']
  puts "Printing Group:#{group} Code:#{code}"
  printer.print_report(ConsumerCodeReport.new(group, code))
end

puts 'Finish'
printer.close
