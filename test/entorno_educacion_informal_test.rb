require "test_helper"
class EntornoEducacionInformalTest < Test::Unit::TestCase
  def test_clase_vacia
    assert_nothing_raised do
      RecursosEducativos::EntornoEducacionInformal.new(nil,nil,nil,nil)
    end
  end
end
