require "test_helper"
class EntornoEducacionFormalTest < Test::Unit::TestCase
  def test_clase_vacia
    assert_nothing_raised do
      RecursosEducativos::EntornoEducacionFormal.new(nil,nil,nil,nil)
    end
  end
end

