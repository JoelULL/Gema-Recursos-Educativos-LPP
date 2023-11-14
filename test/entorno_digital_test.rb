require "test_helper"
class EntornoDigitalTest < Test::Unit::TestCase
  def test_class_empty
    assert_nothing_raised do
      RecursosEducativos::EntornoDigital.new
    end
  end
end
