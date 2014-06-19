# -*- encoding: utf-8 -*-
$:.unshift(File.join(File.dirname(__FILE__), "../lib"))
$:.unshift(File.join(File.dirname(__FILE__)))

require 'rescpos'
require 'reports/dish_item_report'
require 'reports/bill_list_report'
require 'reports/array_table_report'
require 'reports/consumer_code_report'


Rescpos.configure do |config|
  config.template_path = File.expand_path(File.join(File.dirname(__FILE__), 'escposes'))
end

printer = Rescpos::Printer.open("/dev/usb/lp0")

for i in 1..5
  printer.print_report(ConsumerCodeReport.new)
end

printer.close
