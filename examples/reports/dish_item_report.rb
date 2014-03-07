# -*- encoding: utf-8 -*-
$:.unshift(File.join(File.dirname(__FILE__), "../../lib"))

require 'rescpos'

class DishItemReport < Rescpos::Report
  attr_reader :bill, :dish

  def initialize
    @bill = {
      :id => "20140819000002",
      :waiter => '000',
      :created_at => '2014-08-18 13:11:03',
      :table => '01B[大堂]',
      :num_of_people => 2
    }

    @dish = {
      :name => '油条',
      :quantity => 1,
      :dish_category => '面组'
    }
  end
end
