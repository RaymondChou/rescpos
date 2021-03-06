# -*- encoding: utf-8 -*-
$:.unshift(File.join(File.dirname(__FILE__), "../../lib"))

require 'rescpos'

class BillListReport < Rescpos::Report
  attr_reader :bill, :bill_items

  def initialize
    @bill_items = [{
      :name => '傻逼油条',
      :quantity => 2,
      :dish_category => '面组'
    }, {
      :name => '翔油条',
      :quantity => 3,
      :dish_category => '面组'
    }, {
      :name => '超级大翔油条',
      :quantity => 1,
      :dish_category => '面组'
    }]

    @bill = {
      :id => "20140819000002",
      :waiter => '000',
      :created_at => '2014-08-18 13:11:03',
      :table => '01B[大堂]',
      :num_of_people => 2, 
    }
  end
end
