# -*- encoding: utf-8 -*-
$:.unshift(File.join(File.dirname(__FILE__), "../../lib"))

require 'rescpos'

class ConsumerCodeReport < Rescpos::Report
  attr_reader :group, :bill_items

  def initialize
    @code = 41874225
    @group = 103
  end
end
