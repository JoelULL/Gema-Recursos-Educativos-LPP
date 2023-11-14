require "test_helper"
class DigitalesAbiertosTest < Test::Unit::TestCase
  def test_class_empty
    assert_nothing_raised do
      RecursosEducativos::DigitalesAbiertos.new(1,"marca","titulo","descripcion","nivel","tipo","categoria","material",60,[:razonamiento])
    end
  end
end
