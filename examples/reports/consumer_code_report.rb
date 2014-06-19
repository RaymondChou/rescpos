# -*- encoding: utf-8 -*-
$:.unshift(File.join(File.dirname(__FILE__), "../../lib"))

require 'rescpos'

class ConsumerCodeReport < Rescpos::Report
  attr_reader :group, :bill_items

  def initialize(group, code)
    @code = code
    @group = group
  end
end
