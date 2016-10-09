require 'test_helper'

class StatusciTest < ActiveSupport::TestCase
  test "the truth" do
  	ci = Ci.new()	
    assert ! ci.valid?
  end
end
